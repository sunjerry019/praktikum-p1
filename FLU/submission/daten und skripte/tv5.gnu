set term epslatex color size 5.5in, 4in
set output "tv5-plot.tex"
set decimalsign locale 'de_DE.UTF-8'

set title "Zusammenhang zwischen Viskosität des Öls und Temperatur"
set xlabel "Reziproke der Temperatur $1/T$ ($\\si{\\per\\kelvin}$)"
set ylabel "$\\ln \\left[\\eta / \\si{\\pascal\\second}\\right]$"

f(x) = m*x + c
g(x) = n*x + d

# (x, y, xdelta, ydelta)
fit f(x) "tv5_rizoel.dat" u (1/($1 + 273.15)):(log($2)) via m,c
fit g(x) "tv5_getriebeoel.dat" u (1/($1 + 273.15)):(log($2)) via n,d

set key right bottom
set mxtics
set mytics
set xrange [0.00327:0.00355]

constmin = (1/(21.0 + 273.15))
constval = (1/(21.5 + 273.15))
constmax = (1/(22.0 + 273.15))
rymin = f(constmin)
ryval = f(constval)
rymax = f(constmax)
gymin = g(constmin)
gyval = g(constval)
gymax = g(constmax)

print "rymin: ".gprintf("%.8f", exp(rymin))
print "ryval: ".gprintf("%.8f", exp(ryval))
print "rymax: ".gprintf("%.8f", exp(rymax))
print "gymin: ".gprintf("%.8f", exp(gymin))
print "gyval: ".gprintf("%.8f", exp(gyval))
print "gymax: ".gprintf("%.8f", exp(gymax))

# (x, y)
set arrow from constmin,-1.5 to constmin,1 nohead lc rgb 'blue' dt 3
set arrow from constmax,-1.5 to constmax,1 nohead lc rgb 'blue' dt 3
set arrow from constval,-1.5 to constval,1 nohead lc rgb 'blue' dt 3
set arrow from 0.00327,rymin to constmin,rymin nohead lc rgb 'blue' dt 3
set arrow from 0.00327,rymax to constmax,rymax nohead lc rgb 'blue' dt 3
set arrow from 0.00327,ryval to constval,ryval nohead lc rgb 'blue' dt 3
set arrow from 0.00327,gymin to constmin,gymin nohead lc rgb 'blue' dt 3
set arrow from 0.00327,gymax to constmax,gymax nohead lc rgb 'blue' dt 3
set arrow from 0.00327,gyval to constval,gyval nohead lc rgb 'blue' dt 3

set label "\\scriptsize Min Temp \\SI{21.0}{\\celsius}" at (constmin+0.000005),0.9 right rotate by 90 font ',9'
set label "\\scriptsize Max Temp \\SI{22.0}{\\celsius}" at (constmax-0.000005),0.9 right rotate by 90 font ',9'
set label "\\scriptsize \\num{".gprintf("%.8f", rymin)."}" at 0.00328,(rymin+0.07) font ',9'
set label "\\scriptsize \\num{".gprintf("%.8f", rymax)."}" at 0.00328,(rymax-0.07) font ',9'
set label "\\scriptsize \\num{".gprintf("%.8f", gymin)."}" at 0.00328,(gymin+0.07) font ',9'
set label "\\scriptsize \\num{".gprintf("%.8f", gymax)."}" at 0.00328,(gymax-0.07) font ',9'
set label "\\textcolor{red}{\\scriptsize (\\num{".gprintf("%.8f", constval)."}, \\num{".gprintf("%.8f", ryval)."})}" at (constval+0.000005),(ryval-0.07) font ',9' 
set label "\\textcolor{red}{\\scriptsize (\\num{".gprintf("%.8f", constval)."}, \\num{".gprintf("%.8f", gyval)."})}" at (constval+0.000005),(gyval-0.07) font ',9' 

set style fill solid 1.0 border -1
set object circle at constmin,rymin size 0.000001 fc rgb 'black'
set object circle at constval,ryval size 0.000001 fc rgb 'red'
set object circle at constmax,rymax size 0.000001 fc rgb 'black'
set object circle at constmin,gymin size 0.000001 fc rgb 'black'
set object circle at constval,gyval size 0.000001 fc rgb 'red'
set object circle at constmax,gymax size 0.000001 fc rgb 'black'

tein = "$".gprintf("%.5f", m)."x - ".gprintf("%.5f", -c)."$"
tzwo = "$".gprintf("%.5f", n)."x - ".gprintf("%.5f", -d)."$"
plot f(x) title tein lc rgb 'dark-green', \
	g(x) title tzwo lc rgb 'dark-goldenrod', \
	"tv5_rizoel.dat" u (1/($1 + 273.15)):(log($2)) title "Rizinusöl" pointtype 1 lc rgb 'dark-green', \
	"tv5_getriebeoel.dat" u (1/($1 + 273.15)):(log($2)) title "Getriebeöl" pointtype 2 lc rgb 'dark-goldenrod'
