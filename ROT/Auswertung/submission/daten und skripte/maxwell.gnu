set term epscairo font "Linux Libertine, 14" size 5in, 4in
set output "maxwell.eps"
set decimalsign locale 'de_DE.UTF-8'

set title "Zusammenhang zwischen Schwingungsdauer und maximaler Höhe\n(Nach Augenmaß)"
set xlabel "Quadrate der Schwingungsdauer (s^2)"
set ylabel "Höhe (mm)"
set key left top

f(x) = m*x + c

# (x, y, xdelta, ydelta)
fit f(x) "maxwell.dat" u ($2**2):1:($2*2*(0.5)):(5) xyerrors via m,c

set yrange [200:900]
set xrange [15:125]

t = gprintf("%.3f", m)."x + ".gprintf("%.3f", c)
plot f(x) title t, "maxwell.dat" u ($2**2):1:($2*2*(0.5)):(5) with xyerrorbars pointtype 0 title "maxwell.dat"

# fit f(x) "maxwell.dat" u ($2**2):1 via m,c

# plot f(x) title sprintf("%.3fx+%.3f", m, c), "maxwell.dat" u ($2**2):1 pointtype 0 title "maxwell.dat"