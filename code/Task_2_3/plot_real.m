function plot_real()
    x = -3:0.01:4;  % x = left border, step, right border
    plot(x, calc_f(x));
    grid on;
end