function plot_task2()
    r = roots([-2 5 5 2 1]);    % finds roots for -2*x.^4 + 5*x.^3 + 5*x.^2 + 2*x + 1
    plot(real(r),imag(r),'bo')  % plots with blue circles
    grid on
    xlabel('Real') 
    ylabel('Imaginary') 
end