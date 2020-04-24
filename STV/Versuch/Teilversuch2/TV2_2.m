% 50 Messungen 
% Dateilesen funktioniert nicht
A = [0:4];
B = [4, 10, 16, 14, 6];

m1 = dot(A, B)/ sum(B);

% 100 Messungen 
C = [0:6];
D = [6, 22, 31, 20, 14, 5, 2];
m2 = dot(C, D)/ sum(D);

disp(m1)
disp(m2)

% Plotten
title('Verteilung der Zählrate je 2s');
yyaxis left;
bar(A, B, 'b');
xlabel('Anzahl gemessener Quanten');
ylabel('Häufigkeit (50 Messungen)');

yyaxis right;
bar(C, D, 'r');
ylabel('Häufigkeit (100 Messungen)');

hold on;
stem(m2, 40);
legend('50 Messungen', '100 Messungen', 'Mittelwert (100 Mess.)');
hold off;
