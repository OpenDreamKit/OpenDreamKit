set terminal pdf  transparent enhanced color
#font "arial,10" fontscale 1.0 
set output 'histo_luke43.pdf'
#set boxwidth 0.9 absolute
set style fill   solid 1.00 border lt -1
set key fixed right top vertical Right noreverse noenhanced autotitle nobox
#set style increment default
set style histogram clustered gap 1 title textcolor lt -1
set style data histograms
set xtics border in scale 0,0 nomirror rotate by -45  autojustify
set xtics  norangelimit 
set xtics   ()
set xlabel 'number of cores'
set ylabel 'Time (s)'
set title "n=20000 over GF(1048573) on a Xeon E5-2680 v4" 
plot 'luke43_20k.data' using 2:xticlabels(1) title 'Matrix product', '' u 3 title 'Determinant', '' u 4 title 'Echelon form'
