%% This function is to define the tendency increment and decreament
% Input:
%           genderAgents := the gender of the agents
%           alpha := the base increament and decreament of claiming tendency
%           beta := the base increament and decreament of granting tendency
% Output: the claiming and granting adjust of each individual
%           claiming_adjust := N*2  | claim increament | claim decreament |
%           granting_adjust := N*2  | claim increament | claim decreament | 
function [claiming_adjust, granting_adjust] = initIncreDecreTendency(genderAgents, alpha, beta)
    % ini
    claiming_adjust = zeros(length(genderAgents), 2);
    granting_adjust = zeros(length(genderAgents), 2);
    
    % assumption: increament equals to decreament, and there is no gender differnece
    claiming_adjust(:,1) = alpha;
    claiming_adjust(:,2) = alpha;

    granting_adjust(:,1) = beta;
    granting_adjust(:,2) = beta;
    
end

% Test PASS