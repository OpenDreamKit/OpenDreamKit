#!/bin/bash

#==============
#===== GNU plot

DIMENSION=100
BITSIZE=40

DATA_FILENAME="parallel-detailed_${DIMENSION}n_${BITSIZE}b.txt"
GNUPLOT_FILENAME=".parallel-detailed.gnp"
GNUPLOT_OUTPUT_FILENAME="parallel-detailed.pdf"

PS="1 2 4 8 16"

# Split by cluster

PLOT_COMMAND="plot"
for P in ${PS}; do
    FILENAME=".p_${P}.txt"
    TS="1 4"

    echo "T INIT LIFTING" > ${FILENAME}
    for T in ${TS}; do
        INIT_TIME=$(cat ${DATA_FILENAME} | grep "\-t ${T} " -B 8 | grep "\-p ${P} " -B 8 | grep "init (" | cut -d'(' -f2 | cut -d' ' -f1)
        LIFTING_TIME=$(cat ${DATA_FILENAME} | grep "\-t ${T} " -B 8 | grep "\-p ${P} " -B 8 | grep "lifting (" | cut -d'(' -f2 | cut -d' ' -f1)
        echo "${T} ${INIT_TIME} ${LIFTING_TIME}" >> ${FILENAME}
    done

    # Hide titles for after first drawing
    if [ "${P}" == "2" ]; then
        TITLE_INIT="Matrix inversions"
        TITLE_LIFTING="Lifting"
    else
        TITLE_INIT=""
        TITLE_LIFTING=""
    fi

    PLOT_COMMAND="${PLOT_COMMAND} newhistogram \"${P}\", '${FILENAME}' using 2:xticlabels(1) title \"${TITLE_INIT}\" linecolor rgb \"#ff6961\", '${FILENAME}' using 3:xticlabels(1) title \"${TITLE_LIFTING}\" linecolor rgb \"#fdfd96\","
done

# Header
cat > ${GNUPLOT_FILENAME} << EOF
set term pdf enhanced color

set style data histograms
set style histogram rowstack gap 1
set style fill solid border rgb "#202020"

set boxwidth 0.8
set grid ytics
set key top center

set key autotitle columnheader
set xlabel 'primes count (${DIMENSION}x${DIMENSION} bitsize ${BITSIZE})'
set ylabel 'time (s)'

set output '${GNUPLOT_OUTPUT_FILENAME}'
set multiplot
#set logscale y

${PLOT_COMMAND}
# ${PLOT_COMMAND_PARALLEL}
EOF

gnuplot "${GNUPLOT_FILENAME}"
echo "Generated ${GNUPLOT_OUTPUT_FILENAME}"
