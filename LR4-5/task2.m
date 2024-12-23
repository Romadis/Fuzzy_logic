%Проверяем согласованность
function con = checkCon(pairwiseComparisons,os)
    pairGeomean = geomean(pairwiseComparisons,2);
    %disp(pairGeomean);
    pairGeomeanNorm = pairGeomean/sum(pairGeomean);

    pairColumnSum = sum(pairwiseComparisons);
    %disp(pairColumnSum);

    labmdaMax = dot(pairGeomeanNorm,pairColumnSum);
    is = (labmdaMax - length(pairwiseComparisons))/(length(pairwiseComparisons)-1);
    con = is/os < 0.1;
end

function degrees = calcDegrees(pairwiseComparisons)
    pairGeomean = geomean(pairwiseComparisons,2);
    %disp(pairGeomean);
    pairGeomeanNorm = pairGeomean/sum(pairGeomean);
    degrees = pairGeomeanNorm;
end;

function outputString = displayNewFuzzySet(degrees,names,setName)
    outputStr = strcat(setName,' =');
    % Форматируем строки для каждого элемента и конкатенируем их
    for i = 1:length(degrees)-1
        outputStr = strcat(outputStr,sprintf(" %s/M(%.2f)+", names(i), degrees(i)));
    end;
    outputString = strcat(outputStr,sprintf(" %s/M(%.2f)", names(length(degrees)), degrees(length(degrees))));
end;

function degreesUnzip = unzipDegrees(degrees)
    degreesUnzip = [];
    for i= 1:8
        degreesUnzip = [degreesUnzip,repmat(degrees(i),1,15)];
    end;
end;

%А - молодой
%Создаем пустую матрицу сравнений
%Сделаем не для всех значений, а для участков по 15 лет
names = ["1-15","16-30","31-45","46-60","61-75","76-90","91-105","106-120"];
%disp(names);
pairwiseComparisonsA = [
    [1,2,3,4,5,6,7,8],
    [1/2,1,2,3,4,5,6,7],
    [1/3,1/2,1,3,4,5,6,7],
    [1/4,1/3,1/3,1,2,3,4,5],
    [1/5,1/4,1/4,1/2,1,2,3,4],
    [1/6,1/5,1/5,1/3,1/2,1,2,3],
    [1/7,1/6,1/6,1/4,1/3,1/2,1,2],
    [1/8,1/7,1/7,1/5,1/4,1/3,1/2,1]
];
%disp(checkCon(pairwiseComparisonsA,1.41));
degreesA = calcDegrees(pairwiseComparisonsA);
disp(displayNewFuzzySet(degreesA,names,"A"))

%B - старый
pairwiseComparisonsB = [
    [1,1/2,1/3,1/4,1/5,1/6,1/7,1/8],
    [2,1,1/2,1/3,1/4,1/5,1/6,1/7],
    [3,2,1,1/2,1/3,1/4,1/5,1/6],
    [4,3,2,1,1/2,1/3,1/4,1/5],
    [5,4,3,2,1,1/2,1/3,1/4],
    [6,5,4,3,2,1,1/2,1/3],
    [7,6,5,4,3,2,1,1/2],
    [8,7,6,5,4,3,2,1]
];

%disp(checkCon(pairwiseComparisonsB,1.41));
degreesB = calcDegrees(pairwiseComparisonsB);
disp(displayNewFuzzySet(degreesB,names,"B"))


%С - очень молодой
pairwiseComparisonsC = [
    [1,2,3,5,6,7,8,9],
    [1/2,1,2,3,5,6,7,9],
    [1/3,1/2,1,2,3,5,6,7],
    [1/5,1/3,1/2,1,2,3,4,5],
    [1/6,1/5,1/3,1/2,1,2,3,4],
    [1/7,1/6,1/5,1/3,1/2,1,2,3],
    [1/8,1/7,1/6,1/4,1/3,1/2,1,2],
    [1/9,1/9,1/7,1/5,1/4,1/3,1/2,1]
];

%disp(checkCon(pairwiseComparisonsC,1.41));
degreesC = calcDegrees(pairwiseComparisonsC);
disp(displayNewFuzzySet(degreesC,names,"C"))


%D - не старый
pairwiseComparisonsD = [
    [1,2,3,5,6,7,8,9],
    [1/2,1,2,4,5,7,8,9],
    [1/3,1/2,1,3,4,5,6,7],
    [1/5,1/4,1/3,1,2,3,4,5],
    [1/6,1/5,1/4,1/2,1,2,3,4],
    [1/7,1/7,1/5,1/3,1/2,1,2,3],
    [1/8,1/8,1/6,1/4,1/3,1/2,1,2],
    [1/9,1/9,1/7,1/5,1/4,1/3,1/2,1]
];

%disp(checkCon(pairwiseComparisonsD,1.41));
degreesD = calcDegrees(pairwiseComparisonsD);
disp(displayNewFuzzySet(degreesD,names,"D"))


figure(Name="Множества возрастов")
plot(1:120,unzipDegrees(degreesA),'y','DisplayName','Молодой');
hold on
plot(1:120,unzipDegrees(degreesB),'g','DisplayName','Старый');
plot(1:120,unzipDegrees(degreesC),'b','DisplayName','Очень молодой');
plot(1:120,unzipDegrees(degreesD),'r','DisplayName','Не старый');

hold off
legend show
title('Множества возрастов');
xlabel('Промежутки возрастов');
ylabel('Степени принадлежности');