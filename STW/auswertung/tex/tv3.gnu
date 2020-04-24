#!/usr/bin/env gnuplot

set term epslatex color size 6in, 4in
set output "tv3-plot.tex"
set decimalsign locale 'de_DE.UTF-8'

set title "Oberschwingungen"
set xlabel "Ordnungszahl $n$"
set ylabel "Frequenz $f_n$ ($\\si{\\hertz}$)"

set mxtics
set mytics

set key right bottom

f(x) = m*x + c

# (x, y, xdelta, ydelta)
fit f(x) "tv3.dat" u 1:2:(1) yerrors via m,c

titel = gprintf("%.6f", m)."n + ".gprintf("%.6f", c)
plot f(x) title titel lc rgb 'dark-magenta', \
	"tv3.dat" u 1:2:(1) with yerrorbars title "Messpunkte" lc rgb 'dark-goldenrod'