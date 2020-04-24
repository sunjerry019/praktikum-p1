% dlmread funktioniert wieder nicht
A = [60,62,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,...
    84,85,86,87,88,89,90,91,92,93,97,98,104,103];
B = [2,1,1,2,4,2,3,5,5,2,3,5,5,5,2,4,8,4,5,1,1,7,3,2,1,3,3,2,2,1,1,1,1,...
    1,1,1];

mit = dot(A, B)/ sum(B);

sA = A - mit;
ssA = sA.^2;
sigma = sqrt((1/(sum(B)-1))*dot(ssA,B));

disp(mit)
disp(sigma)

gaussvert = normpdf(A,mit,sigma);

% Plotten
title('Verteilung der Zählrate je 2s');

plotyy(A, B, A, gaussvert,  'bar', 'plot');
ylabel('Häufigkeit');

hold on;
stem(mit, 10);
legend('Messwerte', 'Gauss Verteilung', 'Mittelwert');
hold off;




