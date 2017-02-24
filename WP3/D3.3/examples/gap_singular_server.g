# GAP SCSCP server for the example of calling Singular from Python SCSCP client

LogTo(); # to close log file if it was opened from .:
LoadPackage("singular");
LoadPackage("scscp");

SetInfoLevel(InfoSCSCP,4);

AssemblePolynomial := function( extrep )
local fam, rep, coeffs, mons, i, term, j, p;
fam := RationalFunctionsFamily(FamilyObj(1));
rep := [ ];
coeffs := extrep[1];
mons   := extrep[2];
for i in [1..Length(coeffs)] do
  term:=[];
  for j in [1..Length(mons[i])] do
    if mons[i][j]>0 then
      Append(term,[j,mons[i][j]]);
    fi;  
  od;
  Append( rep, [ term, coeffs[i] ] );
od; 
p:=PolynomialByExtRep(fam,rep);
return p;
end;

DisassemblePolynomial:=function(f)
local rep, coeffs, mons, deg, t, r, i, term, mon, j;
rep := ExtRepPolynomialRatFun(f);
coeffs := [];
mons   := [];
deg    := Maximum( List( Filtered(rep{[1,3..Length(rep)-1]}, t -> Length(t)>0), 
                         r -> Maximum(r{[1,3..Length(r)-1]}) ) );
for i in [1,3..Length(rep)-1] do
  term := rep[i];
  mon := ListWithIdenticalEntries(deg,0);
    for j in [1,3..Length(term)-1] do
      mon[term[j]]:=term[j+1];
    od;
  Add( mons, mon );
  Add( coeffs, rep[i+1]);
od;
return [coeffs,mons];
end;

# Thus, f = AssemblePolynomial( DisassemblePolynomial( f ) )

GroebnerBasisWithSingular:=function( extreps )
local R, r, I, B;
R:=PolynomialRing( Rationals, Maximum(List( extreps, r -> Length(r[2]) ) ) );
I:=Ideal( R, List( extreps, AssemblePolynomial ) );
B:=GroebnerBasis(I);
return List(B,DisassemblePolynomial);
end;

PingPongPoly := x -> DisassemblePolynomial( AssemblePolynomial ( x ) );

InstallSCSCPprocedure( "Identity", x -> x, "Identity procedure for tests", 1, 1 );

InstallSCSCPprocedure( "PingPongPoly", PingPongPoly, "Decode/encode polynomial and send it back", 1, 1 );

InstallSCSCPprocedure( "GroebnerBasisWithSingular", GroebnerBasisWithSingular, "Groebner Basis with Singular", 1, 1 );




RunSCSCPserver( SCSCPserverAddress, SCSCPserverPort : OMignoreMatrices);
