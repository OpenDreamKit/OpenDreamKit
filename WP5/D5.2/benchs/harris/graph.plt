set terminal pdf
set logscale y
#set logscale x
set key top left
set grid
set xtics font ", 14"
set ytics font ", 14"
set key font ",14"
set output "graph.pdf"
set ylabel "Elapsed Time (ms)"
#set xtics rotate by -45
set yrange [5:]
#set style fill solid 1.00 border 0
set title ""
plot 'org.dat' using 2:xtic(1) ti "Cython" with lines lw 3, \
     'pythran.dat' using 2:xtic(1) ti "Cython + Pythran" with lines lw 3, \
     'pythran_simd.dat' using 2:xtic(1) ti "Cython + Pythran + AVX2" with lines lw 3
