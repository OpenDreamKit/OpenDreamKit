set terminal pdf
set logscale y
set logscale x
set key top left
set grid
set xtics font ", 14"
set ytics font ", 14"
set key font ",14"
set output "graph.pdf"
set ylabel "Elapsed Time (ms)"
set xtics rotate by -45
#set yrange [0:]
#set style fill solid 1.00 border 0
set title ""
plot 'org.dat' using 1:2 ti "Cython"  with lines lw 3 lc rgb 'blue', \
     'pythran.dat' using 1:2 ti "Cython + Pythran" with lines lw 3 lc rgb 'red', \
     'pythran_simd.dat' using 1:2 ti "Cython + Pythran + AVX2" with lines lw 3 lc rgb 'green'
