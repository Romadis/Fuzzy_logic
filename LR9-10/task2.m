function out = calcSmoothTrap(x)
disp(size(x));
    for i=1:size(x,1)
        for j=1:size(x,2)
            if x(i,j)<4
                y(i,j) = smf(x(i,j),[0,4]);
            elseif x(i,j)>=4 && x(i,j)<6
                y(i,j) = 1;
            else
                y(i,j) = zmf(x(i,j),[6,10]);
            end
        end
    end
    out = y;
end

function out = calcImplication(x1,x2)
[X,Y] = meshgrid(x1,x2);
Z = min(trimf(X,[7,10,13]),calcSmoothTrap(Y));
out = Z;

figure
plot3(X,Y,Z);
title("График функции импликации");
end

x1 = linspace(0,15,1000);
x2 = linspace(0,15,1000);
calcImplication(x1,x2);
