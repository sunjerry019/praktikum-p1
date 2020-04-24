set term epslatex color
set output "tv3-plot.tex"
set decimalsign locale 'de_DE.UTF-8'

set title "Wasserstand beim Kapilarviskosimeter im Verlauf der Zeit"
set xlabel "Zeit $t$ ($\\si{\\second}$)"
set ylabel "$\\ln \\left[\\left(h - h_\\infty\\right) / \\si{\\milli\\meter}\\right]$"

m = -1
f(x) = m*x + c

# (x, y, xdelta, ydelta)
fit f(x) "tv3.dat" u (60*$1):(log($2-83)):(0.2):(sqrt(5)/($2-83)) xyerrors via m,c

t = "$".gprintf("%.5f", m)."x + ".gprintf("%.5f", c)."$"
plot f(x) title t, "tv3.dat" u (60*$1):(log($2-83)):(0.2):(sqrt(5)/($2-83)) with xyerrorbars pointtype 0 title "tv3.dat"
