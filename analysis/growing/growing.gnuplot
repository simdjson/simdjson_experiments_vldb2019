set term pdfcairo fontscale 0.65 noenhanced
set output name
set style fill solid
set ylabel "parsing speed (GB/s)"
set xlabel "input size (KB)"

# Line style for grid
set style line 81 lt 0  # dashed
set style line 81 lt rgb "#808080"  # grey

set grid back linestyle 81
set border 3 back linestyle 80 # Remove border on top and right.  These
             # borders are useless and make it harder
             # to see plotted lines near the border.
    # Also, put it in grey; no need for so much emphasis on a border.
set xtics nomirror
set ytics nomirror
#set xrange [-0.5:]
#set key center top
#set yrange [0:3.2]
#set format y "%0.1f";
#set style data histogram
#set style histogram cluster gap 1
set yrange [0:]

#color1 = "#ff0c18";color2 = "#000000";color4 = "#555500"; color3 = "#0c24ff";
#set xtic rotate by 300 scale 1

plot filename using ($1/1024):2 with lines notitle
