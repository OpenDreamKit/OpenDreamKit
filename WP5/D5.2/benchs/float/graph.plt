set terminal pdf
set logscale y
set logscale x
set grid
set output "graph.pdf"
set ylabel "Elapsed Time (ms)"
set xtics rotate by -45
#set yrange [0:]
#set style fill solid 1.00 border 0
set title ""
plot 'org.dat' using 1:2 ti "Cython" with lines, \
     'pythran.dat' using 1:2 ti "Cython + Pythran" with lines, \
     'pythran_simd.dat' using 1:2 ti "Cython + Pythran + AVX2" with lines
