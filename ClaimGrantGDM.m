%% This function is called by main, and receives parameters to init
% Input
%        N := total amount of agents; Female_rate := gender rate; 
%        K := total lnumber of items need to rate
%        k := the number of the most importnat items that need to ensured
%        alpha := increament / decreament unit of claiming tendecy
%        beta := increament / decreament unit of granting tendecy
%        p := influence radius
%        T := termination time step
% Output := 
function ClaimGrantGDM(N, Female_rate, K, k, alpha, beta, p, T, repeatTimes, num_top_swaps)
    global R Tc Tg % the current R, Tc, and Tg
    
% GDM
    for currentRepeatTimes = 1 : repeatTimes
        % Gender Init
        genderAgents = genderInit(N, Female_rate); % N*1
        
        % Initialize R, Tc, Tg
        [R, Tc, Tg] = init3Tuples(N, K, k, num_top_swaps, genderAgents);
    
        % Initialize alpha, beta for males and females
        [claiming_adjust, granting_adjust] = initIncreDecreTendency(genderAgents, alpha, beta);
        
        % Group decision making
        [dyn_R, dyn_Tc, dyn_Tg] = runClaimGrantGDMSteps(N, K, k, p, T, claiming_adjust, granting_adjust);
        
        % Write the results
    end
    
end