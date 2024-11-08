%% This function is to initiate group opinions
% Input:
%           N := the group size
%           K := the number of items need to evaluate
% Output:
%           R := the initial opinion of male. size: N * K
function R = opinionInit(N, K)
    R = zeros(N, K);
    % Fill each row with a random permutation of 1:K
    for i = 1:N
        R(i, :) = randperm(K);
    end
end