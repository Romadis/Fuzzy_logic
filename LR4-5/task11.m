% Универсальное множество U
U = {'a', 'b', 'c', 'd', 'e'};

% ФП для A
A_values = [0.8, 0, 0.6, 0.9, 1];

% CON(A)
B_values = A_values .^ 2;

% DIL(A) с k=1.5
k = 1.5;
C_values = k * A_values;

% Построение графиков функций принадлежности
figure;
hold on;

% Графики для множеств
plot(1:5, A_values, '-o', 'DisplayName', 'A', 'LineWidth', 1.5);
plot(1:5, B_values, '-s', 'DisplayName', 'B (CON(A))', 'LineWidth', 1.5);
plot(1:5, C_values, '-d', 'DisplayName', 'C (DIL(A))', 'LineWidth', 1.5);

xlabel('Молодые люди');
ylabel('Степень принадлежности');
title('Графики функций принадлежности множеств A, B и C');

xticks(1:5);
xticklabels(U);
legend show;
grid on;
hold off;
