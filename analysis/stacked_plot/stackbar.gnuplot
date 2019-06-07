set term pdfcairo fontscale 0.8 noenhanced
set output name
set boxwidth 0.8
set style fill solid
set ylabel "cycles per input byte"


set style line 80 lt rgb "#000000"

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

set yrange [0:4]
#set key right top;
set key  samplen 1 spacing 1  font ",10"

#set key horizontal invert

set key maxrows 8
set key noenhanced

set key Left opaque  at  5.5,4


set style data histograms
set style histogram rowstacked
set xtic rotate by 300 scale 1

set style line 1 lt rgb "#A00000" lw 2 ps 0
set style line 2 lt rgb "#00A000" lw 2
set style line 3 lt rgb "orange"  lw 2
set style line 4 lt rgb "#5060D0" lw 2
set style line 5 lt rgb "#0099FB" lw 2# "#00008B"
set style line 6 lt rgb "black"  lw 2
set style line 7 lt rgb "blue" lw 1 pt 1 ps 1
set style line 8 lt rgb "#5060D0" lw 1 pt 1 ps 1

clamp(a) = (a < 0) ? 0 : a

plot filename using 9 t " 1: no utf8" ls 1 ,\
 '' using (clamp($3-$9))  t " 1: just utf8" ls 2 ,\
 '' using (clamp($16 + $22 - $4)) t " 2: core" ls 4,\
 '' using (clamp($4 - $22)) t " 2: strings" ls 5,\
 '' using (clamp($4 - $16)):xtic(1) t " 2: numbers" ls 6
############
# The formulas are a bit complex, here is the 
# description:
#################
#ALL:
# 1, 2 mem, 3 st1, 4 st2, 5 total, 6 GBPS
#NOT UTF8
# 7, 8 mem, 9 st1, 10 st2,11 total, 12 GPBS // noutf8
#NOT NUMBER
# 13, 14 mem, 15 st1, 16 st2,  17 total, 18 GPBS // nonumber
#NOT STRING
# 19, 20 mem, 21 st1, 22 st2,  23 total, 24 GPBS // nostring
