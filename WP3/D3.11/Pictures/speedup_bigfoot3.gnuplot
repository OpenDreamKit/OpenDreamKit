set term pdf   transparent enhanced color size 4, 3.4
#font "arial,10" fontscale 1.0 
set output 'speedup_bigfoot3.pdf'
#set boxwidth 0.9 absolute
set style fill   solid 1.00 border lt -1
set key fixed left top vertical Right noreverse noenhanced autotitle nobox
set size ratio 0.7
set xtics   ()
set xlabel 'number of cores'
set ylabel 'Speed-up'
#set logscale x
#set logscale y
set xtics ("1" 1, "2" 2, "4" 4, "8" 8, "16" 16, "32" 32)
set ytics 0,4,32
set xrange [1:32]
set yrange [0:32]
#set title "n=20000 over GF(1048573) on a Xeon Gold 6130" 
plot x title 'Ideal speedup' w l, 'bigfoot3_20k.txt' using 1:(248.095313072/$2) title 'Matrix product' w lp, '' u 1:(122.048365831/$3) title 'Determinant' w lp, '' u 1:(129.617908001/$4) title 'Echelon form' w lp
