#!/usr/bin/env gnuplot

set term epslatex color size 6in, 4in
set output "tv4-plot.tex"
set decimalsign locale 'de_DE.UTF-8'

set title "Resonanzkurve des Rohres bei der 2. Oberschwingung"
set xlabel "Frequenz $f$ ($\\si{\\hertz}$)"
set ylabel "Mikrofonspannung $U_\\text{eff}$ ($\\si{\\milli\\volt}$)"

set mxtics
set mytics
set samples 10000

omeganull = 837.7
beta = 7.4
A = 3
# omeganull = 837.5
# beta = 5.8
# A = 2.9
f(x) = (A*omeganull**2)/(sqrt((omeganull**2 - x**2)**2 + (2*beta*x)**2))

# (x, y, xdelta, ydelta)
# fit f(x) "tv4.dat" u 1:($2-1.1):(1):(sqrt(2)*0.2) xyerrors via omeganull,beta,A
fit f(x) "tv4.dat" u 1:($2-1.1):(1):(2*0.2) xyerrors via omeganull,beta,A


titel = "Angepasste Kurve"
plot f(x) title titel lc rgb 'dark-magenta', \
	"tv4.dat" u 1:2:(1):(sqrt(2)*0.2) with xyerrorbars title "Messpunkte" pointtype 0 lc rgb 'dark-goldenrod'
