set term epscairo font "Linux Libertine, 14" size 5in, 4in
set output "tv2.eps"
set decimalsign locale 'de_DE.UTF-8'

set title "Statistik Galton Brett"
set xlabel "Kanäle"
set ylabel "Höhe (mm)"
set key left top

f(x) = m*x + c

# (x, y, xdelta, ydelta)
fit f(x) "maxwell.dat" u ($2**2):1:($2*2*(0.5)):(5) xyerrors via m,c

set yrange [200:900]
set xrange [15:125]

t = gprintf("%.3f", m)."x + ".gprintf("%.3f", c)
plot f(x) title t, "maxwell.dat" u ($2**2):1:($2*2*(0.5)):(5) with xyerrorbars pointtype 0 title "maxwell.dat"
