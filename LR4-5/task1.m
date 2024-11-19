function outputString = printFuzzySet(setName,universum,degrees)
    outputStr = strcat(setName,' =');
    for i = 1:length(universum)
        outputStr = strcat(outputStr,sprintf(' %s/M(%.2f)+', universum(i), degrees(i)));
    end
    outputStr = outputStr(1:end-1 );
    outputString = outputStr;
end

u = 1:7 
A = [1,0.9,0.6,0.3,0,0,0] %начало недели
B = [0,0.4,0.8,1,0.8,0.4,0.0] %середина недели
C = flip([1,0.9,0.6,0.3,0,0,0]) %конец недели
D = [0,0.3,0.9,1,0.9,0.3,0] %не начало и не конец недели
figure(Name="Множества дней недели")
hold on
plot(u,A,'y')
plot(u,B,'b')
plot(u,C,'g')
plot(u,D,'r') 
hold off
legend('Начало недели','Середина недели','Конец недели','Не начало и не конец недели')
title('Множества дней недели');
xlabel('Дни недели');
ylabel('Степени принадлежности');

uNames = ["Понедельник","Вторник","Среда","Четверг","Пятница","Суббота","Воскресенье"] 
disp(printFuzzySet('A',uNames,A))
disp(printFuzzySet('B',uNames,B))
disp(printFuzzySet('C',uNames,C))
disp(printFuzzySet('D',uNames,D))