set term epscairo

set output "k.eps"

m = 4.42e-3
c = 3.54e-1
f(x) = m*x + c

# (x, y, xdelta, ydelta)
fit f(x) "k.dat" using 1:($3**2):2:(2*($3)*($4)) xyerrors via m,c

set yrange [-0.5:0.85]
set xrange [0:110]

plot "k.dat" using 1:($3**2):2:(2*($3)*($4)) with xyerrorbars, f(x)