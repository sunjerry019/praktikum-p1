#!/usr/bin/env gnuplot
# ver >= 5.2

set term epslatex color size 6in, 4in
set output "tv1-plot.tex"
# set term epscairo color size 5.5in, 4in
# set output "tv1.eps"
set decimalsign locale 'de_DE.UTF-8'

set title "Mikrofonspannung als Funktion der Position"
set xlabel "Position auf optischen Schiene $x$ ($\\si{\\milli\\meter}$)"
set ylabel "Mikrofonspannung $U_\\text{eff}$ ($\\si{\\milli\\volt}$)"

set mxtics
set mytics
set samples 10000

A = 45
b = 95.2
lambda = 134.75
c = 2
f(x) = abs(A*sin(((2*pi)/lambda)*(x - b))) + c

# (x, y, xdelta, ydelta)
fit f(x) "tv1.dat" u 1:2:(0.5):3 xyerrors via A,lambda,b,c

# Anomalie
set style fill solid 0.0 border 7
set object circle at 87.5, 25 size 2 fc rgb 'black'
set label "\\textcolor{red}{\\scriptsize Anomalie}" at 85,27 font ',9'

# Linien
array oneleft[5]   = [93.5, 98.5, 89, 104.5, 87.5]
array oneright[5]  = [97, 89.5, 102, 84.5, 107]
array lastleft[5]  = [232, 225.5, 237.522, 220, 242]
array lastright[5] = [228, 234.5, 223, 237.5, 217.5]
set style fill solid 1.0 border -1
do for [i=1:5] {
	why = i*5
	onemw  = (oneleft[i] + oneright[i])/2
	lastmw = (lastleft[i] + lastright[i])/2

	#(x, y)
	set arrow from oneleft[i],why to oneright[i],why nohead lc rgb 'dark-green' # dt 3
	set arrow from lastleft[i],why to lastright[i],why nohead lc rgb 'dark-green' # dt 3

	set object circle at onemw,why size 0.6 fc rgb 'black'
	set object circle at lastmw,why size 0.6 fc rgb 'black'
}

set arrow from b,0 to b,25 nohead lc rgb 'orange'
set arrow from b+lambda,0 to b+lambda,25 nohead lc rgb 'orange'

set yrange [0:56]
set key top right spacing 1.8

titel = "$\\abs{".gprintf("%.5f", A)."\\sin\\left[\\frac{2\\pi}{".gprintf("%.5f", lambda)."}\\left(x - ".gprintf("%.5f", b)."\\right)\\right]} + ".gprintf("%.5f", c)."$"
plot f(x) title titel lc rgb 'dark-magenta', \
	"tv1.dat" u 1:2:(0.5):3 with xyerrorbars title "Messpunkte" pointtype 0 lc rgb 'dark-goldenrod', \
	"<echo 87,5 25,0" u 1:2:(0.5):(0.2) with xyerrorbars notitle pointtype 0 lc rgb 'red'
