set xlabel "n"
set ylabel "Gfops"
set title "FFLAS::fgemm over GF(1048573) on a Xeon E5-2680 v4 and NVIDIA K40 GPU"
set key top left
#set logscale y 
#set logscale x

set terminal pdf enhanced color
set output "fgemm_GPUvsCPU.pdf"
plot "fgemm_gpu.data"  using 8:4 title 'FFLAS with CUBLAS (GPU)' with linespoints lw 1, "fgemm_cpu.data" using 8:4 title 'FFLAS with OpenBLAS (CPU)' with linespoints lw 1,
