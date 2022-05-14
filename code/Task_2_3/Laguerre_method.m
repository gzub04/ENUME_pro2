function Laguerre_method(x0)     % x0 - initial guess
    accuracy = 1e-6;
    err = inf;
    iter_count = 0;
    n = 4;  % order of polynomial
    % printout of labels and iteration 0
    fprintf("Iteration\t\t\t\tx0\t\t\t\t\tf(x0)\n");
    fprintf("\t%d\t\t%.6f + %.6fi\t%.6f + %.6fi\n", iter_count, real(x0), imag(x0), real(calc_f(x0)), imag(calc_f(x0)));
    while err > accuracy && iter_count < 2000   % loop until error is small enough or iterates too many times
        % just as for MM2, we only have to calculate z- and z+
        z_plus = n*calc_f(x0)/(calc_df(x0) + sqrt((n-1)*((n-1)*calc_df(x0).^2 - n*calc_f(x0)*calc_ddf(x0))));
        z_minus = n*calc_f(x0)/(calc_df(x0) - sqrt( (n-1) * ((n-1)*calc_df(x0).^2 - n*calc_f(x0)*calc_ddf(x0))));
        % choose the smaller one out of z- and z+ and SUBSTRACT it from x0
        if abs(z_plus) < abs(z_minus)
            x0 = x0 - z_plus;
        else
            x0 = x0 - z_minus;
        end
        err = abs(calc_f(x0));  % calculate error
        iter_count = iter_count + 1;
        % print results of iteration
        fprintf("\t%d\t\t%.6f + %.6fi\t%.6f + %.6fi\n", iter_count, real(x0), imag(x0), real(calc_f(x0)), imag(calc_f(x0)));
    end
end