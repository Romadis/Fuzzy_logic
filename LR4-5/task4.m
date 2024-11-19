disciplines = [
		"МИС",
                "ОВП",
                "АЦОМ",
                "Паттерны",
                "Разработка техндокументации",
                "ИБ",
                "Нейросетевые и нечеткие модели",
                "Верификация программных систем",
                "Распределенные системы"
              ]

A = [0.1, 0.3, 0.7, 0.2, 1, 0.8, 1, 0, 0.9]
B = [0.3, 0, 0.2, 0.9, 0, 0.2, 0.3, 0.9, 0.1]
C = [0.9, 0.2, 0.4, 1, 0.1, 0.1, 0.5, 0.9, 0.1]
D = [0.1, 0, 0.3, 0.1, 0.8, 0.6, 0.1, 0.1, 0.5]

function levels = fuzzy_levels(degrees)
    levels = containers.Map('KeyType', 'double', 'ValueType', 'any');
    unique_levels = unique(degrees);
    
    for i = 1:length(unique_levels)
        if unique_levels(i) > 0 % Игнорируем нулевые уровни
            indices = find(degrees >= unique_levels(i));
            levels(unique_levels(i)) = {indices}; % Сохраняем индексы дисциплин
        end
    end
end

% Разложение по уровням
levels_A = fuzzy_levels(A);
levels_B = fuzzy_levels(B);
levels_C = fuzzy_levels(C);
levels_D = fuzzy_levels(D);

disp('Разложение по уровням для множества A (Мне нравится эта дисциплина):');
for level = keys(levels_A)
    fprintf('Уровень %.2f: ', level{1});
    disp(disciplines(cell2mat(levels_A(level{1}))));
end

disp(' '); % Пустая строка для сепарации

disp('Разложение по уровням для множества B (Я не понимаю эту дисциплину):');
for level = keys(levels_B)
    fprintf('Уровень %.2f: ', level{1});
    disp(disciplines(cell2mat(levels_B(level{1}))));
end

disp(' '); % Пустая строка для сепарации

disp('Разложение по уровням для множества C (Мне не нравится эта дисциплина):');
for level = keys(levels_C)
    fprintf('Уровень %.2f: ', level{1});
    disp(disciplines(cell2mat(levels_C(level{1}))));
end

disp(' '); % Пустая строка для сепарации

disp('Разложение по уровням для множества D (Я хотел бы изучать эту дисциплину глубже):');
for level = keys(levels_D)
    fprintf('Уровень %.2f: ', level{1});
    disp(disciplines(cell2mat(levels_D(level{1}))));
end


