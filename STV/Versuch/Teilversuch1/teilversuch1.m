kanale = [0:10];


% Mittlere Stichprobe
disp('Mittlere Stichprobe 1:');
mitdaten = [0,5,12,40,53,53,54,28,8,3,0];
m = dot(kanale, mitdaten)/sum(mitdaten);

skanale = kanale - m;
sskanale = skanale.^2;
sab = sqrt((1/(sum(mitdaten)-1))*dot(sskanale,mitdaten));

disp('Mittlerewert:');
disp(m);
disp('Standardabweichung:');
disp(sab);

% Groﬂe Stichprobe
disp('Groﬂe Stichprobe:');
gdaten = [5,43,104,341,542,605,503,273,111,31,2];
gm = dot(kanale, gdaten)/sum(gdaten);

gskanale = kanale - gm;
gsskanale = gskanale.^2;
gsab = sqrt((1/(sum(gdaten)-1))*dot(gsskanale,gdaten));

disp('Mittlerewert:');
disp(gm);
disp('Standardabweichung:');
disp(gsab);

% Plotten
yyaxis left;
bar(kanale, mitdaten, 'b');
xlabel('Kan‰le');
ylabel('Anzahl Kugeln (n = 256)');

yyaxis right;
bar(kanale, gdaten, 'r');
ylabel('Anzahl Kugeln (n = 2560)');
title('Statistik Galton Brett');

hold on;
stem(gm, 1000);
hold off;

