function outputString = displayNewFuzzySet(degrees,names,setName)
    outputStr = strcat(setName,' =');
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

function degrees = calcDegrees(table)
    degrees = zeros(length(table),1);
    for i=1:size(table,1)
        degrees = degrees + reshape(table(i,1:length(table)),length(table),1);
    end;
    degrees = degrees ./ sum(degrees);
end;
%А - молодой
%Создаем пустую матрицу сравнений
%Сделаем не для всех значений, а для участков по 15 лет
names = ["1-15","16-30","31-45","46-60","61-75","76-90","91-105","106-120"];
%disp(names);
pairwiseComparisonsA = [
    [1,1,1,0,0,0,0,0],
    [1,1,0,0,0,0,0,0],
    [1,1,0,0,0,0,0,0],
    [1,0,0,0,0,0,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,0,0,0,0,0,0],
];
degreesA = calcDegrees(pairwiseComparisonsA);
disp(displayNewFuzzySet(degreesA,names,"A"))

%B - старый
pairwiseComparisonsB = [
    [0,0,0,1,1,1,1,1],
    [0,0,0,1,1,1,1,1],
    [0,0,1,1,1,1,1,1],
    [0,0,0,1,1,1,1,1],
    [0,0,0,0,1,1,1,1],
    [0,0,0,1,1,1,1,1],
];
degreesB = calcDegrees(pairwiseComparisonsB);
disp(displayNewFuzzySet(degreesB,names,"B"))


%С - очень молодой
pairwiseComparisonsC = [
    [1,1,0,0,0,0,0,0],
    [1,0,0,0,0,0,0,0],
    [1,1,0,0,0,0,0,0],
    [1,0,0,0,0,0,0,0],
    [1,1,0,0,0,0,0,0],
    [1,0,0,0,0,0,0,0],
];
degreesC = calcDegrees(pairwiseComparisonsC);
disp(displayNewFuzzySet(degreesC,names,"C"))


%D - не старый
pairwiseComparisonsD = [
    [1,1,1,1,0,0,0,0],
    [1,1,1,0,0,0,0,0],
    [1,1,1,0,0,0,0,0],
    [1,1,1,0,0,0,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,1,0,0,0,0,0],
];
degreesD = calcDegrees(pairwiseComparisonsD);
disp(displayNewFuzzySet(degreesD,names,"D"))



figure(Name="Множества возраста")
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