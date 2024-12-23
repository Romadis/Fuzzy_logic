function result = fuzzy_intersection(mu_A, mu_B)
    keys_A = keys(mu_A);
    keys_B = keys(mu_B);
    result = containers.Map(keys_A, zeros(1, length(mu_A)));
    for i = 1:length(mu_A)
        result(keys_A{i}) = min(mu_A(keys_A{i}), mu_B(keys_B{i}));
    end
end

function result = fuzzy_union(mu_A, mu_B)
    keys_A = keys(mu_A);
    keys_B = keys(mu_B);
    result = containers.Map(keys_A, zeros(1, length(mu_A)));
    for i = 1:length(mu_A)
        result(keys_A{i}) = max(mu_A(keys_A{i}), mu_B(keys_B{i}));
    end
end

function result = fuzzy_negation(mu)
    keys_M = keys(mu);
    result = containers.Map(keys_M, zeros(1, length(mu)));
    for i = 1:length(mu)
        result(keys_M{i}) = max(1 - mu(keys_M{i}), 0);
    end
end

U = {'a', 'b', 'c', 'd', 'e', 'f', 'g'};
A_values = [0, 0.3, 0.7, 1, 0, 0.2, 0.6]; 
B_values = [0.3, 1, 0.5, 0.8, 1, 0.5, 0.6];
C_values = [1, 0.5, 0, 0.2, 0, 0.2, 0.9];

% Функции принадлежности
A_mu = containers.Map(U, A_values);
B_mu = containers.Map(U, B_values);
C_mu = containers.Map(U, C_values);

intersection_AB_mu = fuzzy_intersection(A_mu, B_mu);

union_AB_mu = fuzzy_union(A_mu, B_mu);

neg_B_mu = fuzzy_negation(B_mu);

intersection_ANegB_mu = fuzzy_intersection(A_mu, neg_B_mu);

neg_C_mu = fuzzy_negation(C_mu);

union_ANegB_mu = fuzzy_union(A_mu, neg_B_mu);
intersection_unionANegB_C_mu = fuzzy_intersection(union_ANegB_mu, C_mu);

% ¬(A ∪ B) и ¬C
intersection_negUnionAB_negC_mu = fuzzy_intersection(neg_B_mu, neg_C_mu);

% Вычисление последнего множества: (0.8A^2 v 0.5B^2 v 0.3C^2)
A_squared_values = A_values .^2 * 0.8;
B_squared_values = B_values .^2 * 0.5;
C_squared_values = C_values .^2 * 0.3;

final_union_squared_values = max([A_squared_values; B_squared_values; C_squared_values]);

% Вычисление последнего множества: 0.6(A * B)) ∩ C^2
AB_product_values = zeros(size(A_values));
for i=1:length(A_values)
    AB_product_values(i) = A_values(i) * B_values(i);
end 
C_squared_for_intersection_values = C_values .^2;
final_intersection_DIL_AB_C_squared_values = min(0.6*AB_product_values,C_squared_for_intersection_values);


% Функция для вывода в канонической форме
function print_canonical_form(mu)
    keys_mu = keys(mu);
    fprintf('Множество:\n');
    for i=1:length(keys_mu)-1
        fprintf('%.2f/%s + ', mu(keys_mu{i}), keys_mu{i});
    end
    fprintf('%.2f/%s', mu(keys_mu{length(keys_mu)}), keys_mu{length(keys_mu)});
    fprintf('\n');
end

% Вывод результатов в канонической форме
disp('Пересечение A и B:');
print_canonical_form(intersection_AB_mu);

disp('Объединение A и B:');
print_canonical_form(union_AB_mu);

disp('Пересечение A и ¬B:');
print_canonical_form(intersection_ANegB_mu);

disp('Пересечение (A ∪ ¬B) и C:');
print_canonical_form(intersection_unionANegB_C_mu);

disp('Пересечение ¬(A ∪ B) и ¬C:');
print_canonical_form(intersection_negUnionAB_negC_mu);

disp('Объединение (0.8A^2 v 0.5B^2 v 0.3C^2):');
fprintf('%.2f/a + %.2f/b + %.2f/c + %.2f/d + %.2f/e + %.2f/f + %.2f/g\n', final_union_squared_values);

disp('Пересечение 0.6(A * B) и C^2:');
fprintf('%.2f/a + %.2f/b + %.2f/c + %.2f/d + %.2f/e + %.2f/f + %.2f/g\n', final_intersection_DIL_AB_C_squared_values);

% Графики для множеств A, B и C
plot(1:7, A_values, '-o', 'DisplayName', 'A', 'LineWidth', 1.5);
hold on;
plot(1:7, B_values, '-o', 'DisplayName', 'B', 'LineWidth', 1.5);
plot(1:7, C_values, '-o', 'DisplayName', 'C', 'LineWidth', 1.5);

val = intersection_AB_mu.values()
disp(cell2mat(val))

% Графики для операций
plot(1:7, cell2mat(intersection_AB_mu.values), '-s', 'DisplayName', 'A ∩ B', 'LineWidth', 1.5);
plot(1:7, cell2mat(union_AB_mu.values), '-s', 'DisplayName', 'A ∪ B', 'LineWidth', 1.5);
plot(1:7, cell2mat(intersection_ANegB_mu.values), '-s', 'DisplayName', 'A ∩ ¬B', 'LineWidth', 1.5);
plot(1:7, cell2mat(intersection_unionANegB_C_mu.values), '-s', 'DisplayName', '(A ∪ ¬B) ∩ C', 'LineWidth', 1.5);
plot(1:7, cell2mat(intersection_negUnionAB_negC_mu.values), '-s', 'DisplayName', '¬(A ∪ B) ∩ ¬C', 'LineWidth', 1.5);
plot(1:7, final_union_squared_values, '-s', 'DisplayName', '(0.8A^2 v 0.5B^2 v 0.3C^2)', 'LineWidth', 1.5);
plot(1:7, final_intersection_DIL_AB_C_squared_values, '-s', 'DisplayName', '0.6(A * B) и C^2', 'LineWidth', 1.5);

xlabel('Элементы множества');
ylabel('Степень принадлежности');
title('Графики функций принадлежности множеств и операций');
xticks(1:7);
xticklabels(U);
legend show;
grid on;
hold off;
