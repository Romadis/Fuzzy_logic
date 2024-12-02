function out = calcSmoothTrap(x)
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

function out = calcImplication(x,x2)
Z = min(x,calcSmoothTrap(x2));
out = Z;

figure
plot(x2,Z);
ylim([-0.05 1.05]);
title("График функции импликации");
end

function out = calcDiffuz(m)
    x2 = linspace(0,15,1500);
    z=calcImplication(m,x2);
    out = defuzz(x2,z,'bisector');
    figure
    hold on;
    plot(x2,z);
    ylim([-0.05 1.05]);
    title("График функции импликации с центром области");
    gray = 0.7 * [1 1 1];
    h1.Color = gray;
    t1.Color = gray;
    h2 = line([out out],[-0.4 1.2],'Color','k');
    hold off;
end

calcDiffuz(1)