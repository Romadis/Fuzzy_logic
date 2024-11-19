%Проверка согласованности
function con = checkCon(pairwiseComparisons,os)
    pairGeomean = geomean(pairwiseComparisons,2);
    %disp(pairGeomean);
    pairGeomeanNorm = pairGeomean/sum(pairGeomean);

    pairColumnSum = sum(pairwiseComparisons);
    %disp(pairColumnSum);

    labmdaMax = dot(pairGeomeanNorm,pairColumnSum);
    is = (labmdaMax - length(pairwiseComparisons))/(length(pairwiseComparisons)-1);
    con = is/os;
end

function degrees = calcDegrees(pairwiseComparisons)
    pairGeomean = geomean(pairwiseComparisons,2);
    %disp(pairGeomean);
    pairGeomeanNorm = pairGeomean/sum(pairGeomean);
    degrees = pairGeomeanNorm;
end;

function outputString = displayNewFuzzySet(degrees,names,setName)
    outputString = sprintf("%s\n",setName);
    % Форматируем строки для каждого элемента и конкатенируем их
    for i = 1:length(degrees)
        outputString = strcat(outputString,sprintf(" %d | %.2f\n", names(i), degrees(i)));
    end;
end;

function outputString = displayNewFuzzySetStr(degrees,names,setName)
    outputString = sprintf("%s\n",setName);
    % Форматируем строки для каждого элемента и конкатенируем их
    for i = 1:length(degrees)
        outputString = strcat(outputString,sprintf(" %s | %.2f\n", names(i), degrees(i)));
    end;
end;

names = ["Текстильные материалы",
         "Одежда",
         "Нетканые материалы",
         "Обувь",
         "Меховые изделия",
         "Кожаные изделия"
        ];

% По стоимости
pairwiseComparisonsCost = [
    [1,   1/3, 2,   1/2,  1/3, 1/4],
    [3,   1,   4,   3,    2,   1/5],
    [1/2, 1/4, 1,   1/3,  1/4, 1/5],
    [2,   1/3, 3,   1,    1/3, 1/4],
    [3,   1/2, 4,   3,    1, 1/4],
    [4,   5,   5,   4,    4, 1],
];

disp(checkCon(pairwiseComparisonsCost,1.24));
degreesCost = calcDegrees(pairwiseComparisonsCost);
disp(displayNewFuzzySetStr(degreesCost,names,"Cost"))

% По внешнему виду
pairwiseComparisonsDesign = [
    [1,   2,   3,   1/3,   1/2, 3],
    [1/2, 1,   2,   1/3,   2,   4],
    [1/3, 1/2, 1,   1/3,   2,   3],
    [3,   3,   3,   1,     3,   4],
    [2,   1/2, 1/2, 1/3,   1,   2],
    [1/3, 1/4, 1/3, 1/4,   1/2, 1],
];

disp(checkCon(pairwiseComparisonsDesign,1.24));
degreesDesign = calcDegrees(pairwiseComparisonsDesign);
disp(displayNewFuzzySetStr(degreesDesign,names,"Design"));

% По долговечности
pairwiseComparisonsDurability = [
    [1,   2,   1/3, 1,   1/3, 1/3],
    [1/2, 1,   1/4, 1/3, 1/4, 1/4],
    [3,   4,   1,   3,   1,   1],
    [1,   3,   1/3, 1,   1/3, 1/3],
    [3,   4,   1,   3,   1,   1],
    [3,   4,   1,   3,   1,   1],
];

disp(checkCon(pairwiseComparisonsDurability,1.24));
degreesDurability = calcDegrees(pairwiseComparisonsDurability);
disp(displayNewFuzzySetStr(degreesDurability,names,"Durability"))

% По размеру
pairwiseComparisonsSize = [
    [1,   1/3, 3,   1/2, 2,   1/4],
    [3,   1,   4,   2,   3,   1/2],
    [1/3, 1/4, 1,   1/4, 1/2, 1/6],
    [2,   1/2, 4,   1,   3,   1/2],
    [1/2, 1/3, 2,   1/3, 1,   1/3],
    [4,   2,   6,   2,   3,   1],
];

disp(checkCon(pairwiseComparisonsSize,1.24));
degreesSize = calcDegrees(pairwiseComparisonsSize);
disp(displayNewFuzzySetStr(degreesSize,names,"Size"));

% По амортизации
pairwiseComparisonsDepreciation = [
    [1,   3,   1,   3,   1,   4],
    [1/3, 1,   1/3, 1,   1/3, 2],
    [1,   3,   1,   3,   1,   4],
    [1/3, 1,   1/3, 1,   1/3, 2],
    [1,   3,   1,   3,   1,   4],
    [1/4, 1/2, 1/4, 1/2, 1/4, 1],
];

disp(checkCon(pairwiseComparisonsDepreciation,1.24));
degreesDepreciation = calcDegrees(pairwiseComparisonsDepreciation);
disp(displayNewFuzzySetStr(degreesDepreciation,names,"Depreciation"));

% По наценке
pairwiseComparisonsAddcost = [
    [1,   1/3, 2,   1/2,  1/3, 1/4],
    [3,   1,   4,   3,    2,   1/5],
    [1/2, 1/4, 1,   1/3,  1/4, 1/5],
    [2,   1/3, 3,   1,    1/3, 1/4],
    [3,   1/2, 4,   3,    1, 1/4],
    [4,   5,   5,   4,    4, 1],
];

disp(checkCon(pairwiseComparisonsAddcost,1.24));
degreesAddcost = calcDegrees(pairwiseComparisonsAddcost);
disp(displayNewFuzzySetStr(degreesAddcost,names,"Addcost"));

                       % Сравнение критериев
names = ["Cost","Design","Durability","Size","Depreciation","Addcost"];

pairwiseComparisonsProp = [
    [1,     3,   2,    4,    3,    2],
    [1/3,   1,   1/3,  1/4,  1/3,  1/4],
    [1/2,   3,   1,      4,  2,    2],
    [1/4,   4,   1/4,    1,  1/3,  1/2],
    [1/3,   3,   1/2,    3,  1,    2],
    [1/2,   4,   1/2,    2,  1/2,  1],
];

disp(checkCon(pairwiseComparisonsProp,1.24));
degreesProps = calcDegrees(pairwiseComparisonsProp);
disp(displayNewFuzzySetStr(degreesProps,names,"Props"))

result = cat(2,degreesCost,degreesDesign,degreesDurability,degreesSize,degreesDepreciation,degreesAddcost) * degreesProps;

names = ["Текстильные материалы",
         "Одежда",
         "Нетканые материалы",
         "Обувь",
         "Меховые изделия",
         "Кожаные изделия"
        ];

disp(displayNewFuzzySetStr(result,names,"Light_industry"));
