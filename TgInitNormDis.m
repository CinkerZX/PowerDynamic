%% This function is to initiate the granting tendency
% Input:
%           N := the group size
%           genderAgents := the gender of agents (0 - female, 1 - male)
%           mean_male/female := norm distribution parameters
%           var_male/female := norm distribution parameters
% Output:
%           N*N matrix
%           
% Note: elements in Tg are in [0,1]. The matrix is designed for future
% flexibility when agents having discrimination or inclination on
% counter-claim towards specific people

function Tg = TgInitNormDis(N, genderAgents, mean_male, mean_female, var_grant_male, var_grant_female)

    male_indices = find(genderAgents == 1);
    female_indices = find(genderAgents == 0);
    
    % Generate normally distributed values for males
    grant_tendency(male_indices) = normrnd(mean_male, sqrt(var_grant_male), [length(male_indices), 1]);
    
    % Generate normally distributed values for females
    grant_tendency(female_indices) = normrnd(mean_female, sqrt(var_grant_female), [length(female_indices), 1]);
    
    % Clip values to keep them within the range [0, 1]
    grant_tendency = max(0, min(1, grant_tendency));

    Tg = repmat(grant_tendency', 1, N);
end

% Test PASS