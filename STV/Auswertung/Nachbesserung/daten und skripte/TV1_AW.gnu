set term epscairo font 'Linux Libertine, 14'

set output "kleine.eps"

set xrange [-0.5:10.5]
set yrange [0:14]
set xtics 1
set title "Galton-Brett: Anzahl Kugel in jeder Kanal (n = 38)"
set ylabel "Anzahl Kugeln"
set xlabel "Kanal Nummer"

set boxwidth 0.5
set style fill solid
plot "kleine.dat" w boxes title "Kleine Stichprobe", "" u 1:2:2 with labels offset char 0,1 notitle