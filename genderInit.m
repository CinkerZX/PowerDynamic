%% This function is to initialize the gender of group members
% Inputs: N := the group size; Female_rate := the ratio of female
% Outputs: gender of the N agents, size N*1. 1-male, 0 female

function gender = genderInit(N, Female_rate)
    % ini
    gender = zeros(N, 1);
    gender(1: round(N * (1-Female_rate))) = 1;

    gender = gender(randperm(N));
end

% Test - PASS