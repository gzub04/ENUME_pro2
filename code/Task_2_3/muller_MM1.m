function muller_MM1(x0, x1, x2)
    accuracy = 1e-6;
    err = inf;
    iter_count = 0;
    % printout of labels and iteration 0
    fprintf("Iteration\t\t\t\tx2\t\t\t\t\tf(x2)\n");
    fprintf("\t%d\t\t%.6f + %.6fi\t%.6f + %.6fi\n", iter_count, real(x2), imag(x2), real(calc_f(x2)), imag(calc_f(x2)));
    while err > accuracy && iter_count < 2000   % loop until error is small enough or iterates too many times
        % assuming x2 is the actual approximation, we assign:
        z0 = x0 - x2;
        z1 = x1 - x2;
        % calculate a, b and c according to the equations
        a = (calc_f(x0)*z1 + calc_f(x2)*z0 - calc_f(x2)*z1 - calc_f(x1)*z0)/...
            (z0*z1*(z0-z1));
        b = (calc_f(x1) - calc_f(x2) - a*z1^2) / z1;
        c = calc_f(x2);
        % now we need to calculate z- and z+
        z_plus = -2*c/(b + sqrt(b.^2 - 4*a*c));
        z_minus = -2*c/(b - sqrt(b.^2 - 4*a*c));
        % choose the smaller one out of z- and z+ and add it to x2
        if abs(z_plus) < abs(z_minus)
            x3 = x2 + z_plus;
        else
            x3 = x2 + z_minus;
        end
        % reassigning values so that x3 and 2 closest numbers to x3 stay
        tmp0 = abs(x3 - x0);
        tmp1 = abs(x3 - x1);
        tmp2 = abs(x3 - x2);
        if tmp0 > tmp1 && tmp0 > tmp2
            x0 = x1;
            x1 = x2;
        elseif tmp1 > tmp0 && tmp1 > tmp2
            x1 = x2;
        end
        x2 = x3;
        err = abs(calc_f(x2));  % calculate error
        iter_count = iter_count + 1;
        % print results of iteration
        fprintf("\t%d\t\t%.6f + %.6fi\t%.6f + %.6fi\n", iter_count, real(x2), imag(x2), real(calc_f(x2)), imag(calc_f(x2)));
    end
end