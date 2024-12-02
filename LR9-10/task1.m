function out = trapParams()
    x = linspace(0,11,100);
    y = trapmf(x,[1 3 7 10]);
    plot(x,y);
    ylim([-0.05 1.05])
    out = y;
end
trapParams();