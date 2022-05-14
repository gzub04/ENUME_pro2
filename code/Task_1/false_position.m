function false_position(a, b)
    % initial conditions
    if (a < 2 || a > 12 || b < 2 || b > 12)
        error("a and b must be within [2,12] interval");
    end
    if ( calc_f(a) * calc_f(b) >= 0)
        error("a and b must have different signs!");
    end
    
    % initial printout:
    fprintf("Interval: [%f, %f]\n", a, b);
    fprintf("Iteration:\t\tc:\t\tvalue of c:\t\tinterval length:\n");
    err = inf;
    accuracy = 1e-6;
    iter_count = 0;
    % loop until error is small enough or iterates too many times
    while err > accuracy && iter_count < 2000
        a_val = calc_f(a);
        b_val = calc_f(b);
        % calculate c as per equation:
        c = (a * b_val - b * a_val) / (b_val - a_val);
        c_val = calc_f(c);
        % select new interval:
        if a_val * c_val < 0
            b = c;
        elseif c_val * b_val < 0
            a = c;
        end
        iter_count = iter_count + 1;
        err = abs(c_val); % calculate error
        % printing results:
        small_interval = abs(a-b);
        fprintf("\t%d\t\t%.8f\t%.8f\t\t%.8f\n", iter_count, c, c_val, small_interval);
    end
end