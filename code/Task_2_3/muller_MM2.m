function muller_MM2(x0)     % x0 - initial guess
    accuracy = 1e-6;
    err = inf;
    iter_count = 0;
    % printout of labels and iteration 0
    fprintf("Iteration\t\t\t\tx0\t\t\t\t\tf(x0)\n");
    fprintf("\t%d\t\t%.6f + %.6fi\t%.6f + %.6fi\n", iter_count, real(x0), imag(x0), real(calc_f(x0)), imag(calc_f(x0)));
    while err > accuracy && iter_count < 2000   % loop until error is small enough or iterates too many times
        % there is no need to calculate a, b and c
        % so we jsut need to calculate z- and z+
        z_plus = -2*calc_f(x0)/(calc_df(x0) + sqrt(calc_df(x0).^2 - 2*calc_f(x0)*calc_ddf(x0)));
        z_minus = -2*calc_f(x0)/(calc_df(x0) - sqrt(calc_df(x0).^2 - 2*calc_f(x0)*calc_ddf(x0)));
        % choose the smaller one out of z- and z+ and add it to x0
        if abs(z_plus) < abs(z_minus)
            x0 = x0 + z_plus;
        else
            x0 = x0 + z_minus;
        end
        err = abs(calc_f(x0));  % calculate error
        iter_count = iter_count + 1;
        % print results of iteration
        fprintf("\t%d\t\t%.6f + %.6fi\t%.6f + %.6fi\n", iter_count, real(x0), imag(x0), real(calc_f(x0)), imag(calc_f(x0)));
    end
end