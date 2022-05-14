function Newton_method(init_point, a, b)
    % initial conditions
    if init_point < a || init_point > b
        error("Initial guess should be between a and b.");
    end

    % initial printout
    fprintf("Initial guess: %f, interval: [%f, %f]\n", init_point, a, b);
    fprintf("Iteration:\t\tx:\t\tvalue of x:\n");
    accuracy = 1e-6;
    err = inf;
    iter_count = 0;
    curr_x = init_point;
    % loop until result is satisfactory or can't find root
    while err > accuracy || iter_count > 2000    
        % calculate x_n+1 as per equation
        new_x = curr_x - calc_f(curr_x)/calc_df(curr_x);
        if new_x < a || new_x > b
            error("The method diverged!");
        end
        curr_x = new_x;
        err = abs(calc_f(new_x));
        iter_count = iter_count + 1;
        fprintf("\t%d\t\t%.8f\t%.8f\t\n", iter_count, new_x, calc_f(new_x));
    end

end