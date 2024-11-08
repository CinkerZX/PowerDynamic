% You only need to run this main function
function main
    n = 20; % total number of agents
    
    female_rate = 0.5; % gender rate;

    K = 10; % total lnumber of items need to rate
    k = 5; % the number of the most importnat items that need to ensured
    num_top_swaps; % how different is the group opinion over the top k items

    alpha = 0.1; % increament / decreament unit of claiming tendecy
    beta = 0.1; % increament / decreament unit of granting tendecy
    % female tendency + noise
    % male tendency + noise

    p = 0.5; % influence radius
    T = 50; % termination time step
    
    repeatTimes = 10; % The repeat times under one exp setting
    
    ClaimGrantGDM(n, female_rate, K, k, alpha, beta, p, T, repeatTimes, num_top_swaps)

end