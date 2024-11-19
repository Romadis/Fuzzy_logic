% Определение диапазона значений
u = linspace(0, 3, 300); % от 0 до 3

% ФП для A
A_values = (u.^2) / 9;

% ФП для B
B_values = ((u - 3).^2) / 9;


intersection_AB_values = min(A_values, B_values);

union_AB_values = max(A_values, B_values);

neg_B_values = max(1 - B_values, 0);

% A ∩ ¬B
difference_AB_values = min(A_values, neg_B_values); % Убедимся в неотрицательности

% A ∪ ¬B
union_A_negB_values = max(A_values, neg_B_values);

% ¬(A ∩ B)
neg_intersection_AB_values = 1 - intersection_AB_values;

% (A ∩ ¬A) * (B ∩ ¬B)
product_diff_A_B = zeros(size(A_values)); % Всегда = 0

% Построение графиков функций принадлежности
figure;
hold on;

% Графики для множеств A и B
plot(u, A_values, 'b', 'LineWidth', 1.5, 'DisplayName', 'A(u)');
plot(u, B_values, 'r', 'LineWidth', 1.5, 'DisplayName', 'B(u)');

% Графики для операций
plot(u, intersection_AB_values, 'g--', 'LineWidth', 1.5, 'DisplayName', 'A ∩ B');
plot(u, union_AB_values, 'm--', 'LineWidth', 1.5, 'DisplayName', 'A ∪ B');
plot(u, difference_AB_values, 'c--', 'LineWidth', 1.5, 'DisplayName', 'A - B');
plot(u, union_A_negB_values, 'k--', 'LineWidth', 1.5, 'DisplayName', 'A ∪ ¬B');
plot(u, neg_intersection_AB_values, 'y--', 'LineWidth', 1.5, 'DisplayName', '¬(A ∩ B)');
plot(u, product_diff_A_B,'k:', 'DisplayName', '(A ∩ ¬A) * (B ∩ ¬B)', 'LineWidth', 1.5); 

xlabel('u');
ylabel('Степень принадлежности');
title('Графики функций принадлежности множеств и операций');
legend show;
grid on;
hold off;