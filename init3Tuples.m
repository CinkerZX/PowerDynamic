%% This function is to initialize the three tuples
% Input:
%           N := the group size;
%           K := the number of items need to evaluate
% Output:
%           R := the initial opinion of male. size: N * K
%           Tc := the initial claiming tendency. size: N * N
%           Tg := the initial granting tendency. size: N * N

function [R, Tc, Tg] = init3Tuples(N, K, k, num_top_swaps, genderAgents)
    % Init Opinions
    % R = opinionInit(N, K); % N*K
    R = opinionInitCommenSense(N, K, k, num_top_swaps);
    % Init Claiming tendency
    Tc = TcInitNormDis(N, genderAgents, 0.5, 0.5, 0, 0); % N*N
    % Init Granting tendency
    Tg = TgInitNormDis(N, genderAgents, 0.5, 0.5, 0, 0); % N*N
end
