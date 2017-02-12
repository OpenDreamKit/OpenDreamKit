#######################################################################################
# A module for loading .tex files and feeding the data to the various applications.   #
# Copyright (c) 2005, Ioan Sucan, released under the Gnu General Public License (GPL) #
#                                 see http://www.gnu.org/copyleft/gpl.html            #
# $URL: svn://kwarc.eecs.iu-bremen.de/repos/kwarc/projects/content/bin/Modparse.pm$   # 
# $Date: 2005-09-26 12:44:28 -0500 (Mon, 26 Sep 2005) $ $Rev: 4243 $                  #
#######################################################################################

package Modparse;

use File::Basename;
use File::Path;

# if both snippath and snippathList are specified,
# snippathList is ignored !

# if a default snippath definition file is found 
# (snippath.def) it is used if no snippath is given 
# as argument; 
sub new {
    my ($class, %options) = @_;

    $options{recursion} = 1 unless defined $options{recursion};
    $options{requireStatus} = 'include|exclude' unless defined $options{requireStatus};
    $options{loadInputs} = 1 unless defined $options{loadInputs};
    $options{onlyModuleLines} = 0 unless defined $options{onlyModuleLines};

    if ( !(%{$options{snippath}}) && (-e "snippath.def") ) {
	open(SNIPPATHDEF, 'snippath.def');
	my @snlist = <SNIPPATHDEF>;
	close(SNIPPATHDEF); 
	for (my $i = 0 ; $i <= $#snlist; $i++) { chomp($snlist[$i]); }
	%{$options{snippath}} = @snlist; }
    @{$options{snippathList}} = keys(%{$options{snippath}})
	if ($options{snippath} && %{$options{snippath}});
    $options{debug} = 0;

    bless(\%options, $class); }

sub execute{
    my ($self, $file) = @_;
    
    local *run_event = sub {
	my ($event, $arg) = @_;
	if ($self->{$event}) { $self->{$event}($arg); }
    };

    local *go = sub {
	my ($location, %param) = @_;    
	my ($tex, $path, @tex_data) = $self->readLocation($location);
	return unless @tex_data;
	my $NL = $#tex_data+1;

	$param{filename} = $tex;
	$param{depth}++;
	$param{filecount}++;
	my $i = 0; 

	$param{nextline}   = sub { $tex_data[++$i]; };
	$param{prevline}   = sub { $tex_data[--$i]; };
	$param{rewriteline}= sub { $tex_data[$i] = $_[0]; };

	print "Processing $tex...\n" if $self->{verbose};
	run_event('onBeginFile', \%param);

	while ($i<$NL){
	    $param{original} = $tex_data[$i];
	    $_ = $tex_data[$i]; chomp; /([^%]*)((%.*)?)/;
	    ($param{tex}, $param{comment}) = ($1, $2); $_ = $1;
	    s/\s+//g; $param{simple_tex} = $_;

	    if (/\\begin\{module\}(\[([^\]]*)\])?/) {
		if ($param{in_module}) {
		    push(@{$param{module_stack}}, [$param{module_id}, $param{module_arg}]); }
		$param{in_module} = 1;
		$param{module_args} = $1 ? $2 : undef;
		$param{module_id} = ($param{module_args} && 
				     $param{module_args} =~ /id=([^\],]+)/) ? $1 : undef;
		$param{module_nesting}++;
		run_event('onBeginModule', \%param); }
	    
	    if (/\\end\{module\}/) {
		run_event('onEndModule', \%param);
		if ($#{$param{module_stack}} >= 0) {
		    ($param{module_id}, $param{module_args}) = @{pop(@{$param{module_stack}})};
		} else {
		    $param{in_module} = 0;
		    ($param{module_id}, $param{module_args}) = (undef, undef); }
		$param{module_nesting}--;
	    }
	    
	    foreach my $srch_snippath(@{$self->{snippathList}}){
		$self->{snippath}{$srch_snippath} = $1 
		    if (/\\def\\$srch_snippath\#1\{([^\#]+)\#1\}$/); }
	    
	    if ($self->{follow} && (/\\((requiremodules(\[($self->{requireStatus})\])?)|input|include)\{([^\}]+)\}/)){
		my $req_filename = $5; my $req_spath = ''; my $command = $1;
		my $is_require = ($command =~ /requiremodules/) ? 1 : 0;
		if ($is_require || $self->{loadInputs}) {
		    foreach my $srch_snippath(@{$self->{snippathList}}){
			if ($req_filename =~ /\\$srch_snippath\{(.+)/){
			    ($req_spath, $req_filename) = ($self->{snippath}{$srch_snippath}, $1);
			    last; }}
		    run_event('onRecurse', \%param);
		    if ($self->{recursion} || !$is_require) {
			go($self->makeLocation($req_filename, $path, $req_spath), %param); }
		}
	    }
	    run_event('onEveryLine', \%param) if ($param{in_module} || !$self->{onlyModuleLines});

	    last if (/\\end\{document\}/ && $self->{stopAtEnd});
	    $i++;
	}
	run_event('onEndFile', \%param);
	$param{depth}--; return;	
    };
    
    my %param = (pack=>$self, perm=>$self->{_AUX_DATA}, depth=>0, filecount=>0,
		 in_module=>0, module_nesting=>0);
    run_event('onBegin', \%param);
    go($self->makeLocation($file), %param);
    run_event('onEnd', \%param);
    return;
}


# add a [.tex] extension to the filename
sub add_ext{
    my ($self, $fn, $ext) = @_;
    $ext = '.tex' unless $ext;
    $fn.=$ext if $fn !~ /\Q$ext\E$/;
    $fn; }

# as long as the extension is .tex, drop it
sub drop_ext{
    my ($self, $filename) = @_;
    while ($filename =~ /\.tex$/){
	while ($filename !~ /\.$/ ) { chop($filename); }
	chop($filename); }
    $filename; }

sub new_ext{
    my ($self, $filename, $ext) = @_;
    $self->add_ext($self->drop_ext($filename), $ext); }

# location = pointer to array of strings
# first element is filename; next are possible paths
sub makeLocation{ my $self = shift; return \@_; }

# read a location into an array of strings
# aslo return filename and path to it (just in 
# case some changes were made to it, like adding 
# extension and/or relative paths)
sub readLocation{
    my ($self, $location) = @_;
    
    my ($filename, @paths) = @{$location};    
    # try to add proper extension;
    my $filename_ext = $self->new_ext($filename) unless -e $filename;
    $filename = $filename_ext if $filename_ext && -e $filename_ext;
    
    # try search paths
    if (! -e $filename){
	my $all_p = '';
	foreach my $p(@paths){
	    $all_p .= $p;
	    $filename = $all_p.$filename and last if -e $all_p.$filename;
	    $filename = $p.$filename and last if -e $p.$filename;
	    if ($filename_ext){
		$filename = $all_p.$filename_ext and last if -e $all_p.$filename_ext;
		$filename = $p.$filename_ext and last if -e $p.$filename_ext; }
	}}
    # don't do the same work too many times 
    foreach my $file(@{$self->{loadedFiles}})
    { return undef if $file eq $filename; }
    
    push(@{$self->{loadedFiles}}, $filename);
    open(FIN, $filename) or die "Cannot open '$filename'\n";
    my @data = <FIN>;    
    close(FIN);
    
    # find path of current file
    my $path = dirname($filename);
    $path.='/' if ($path ne '');
    
    return ($filename, $path, @data);
}

1;
