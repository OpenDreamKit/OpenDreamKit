set xlabel "matrix dimension n"
set ylabel "Speed (Gfops)"
#set title "FFLAS::fgemm over GF(131071) on a Xeon Gold 6130 and NVIDIA V100 GPU"
set key top left
#set logscale y 
#set logscale x

set terminal pdf enhanced color
set output "fgemm_GPUvsCPU.pdf"
plot "fgemm_bigfoot.data"  every 3 using 8:4 title 'FFLAS with CUBLAS (1 GPU)' with linespoints lw 1, "" every 3::2 using 8:4 title 'FFLAS with OpenBLAS (CPU) 32 cores' with linespoints lw 1, "" every 3::1 using 8:4 title 'FFLAS with OpenBLAS (CPU) 1 core' with linespoints lw 1,
