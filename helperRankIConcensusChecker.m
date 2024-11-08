%% This function is for checking if the group has reach consensus over rank r
% Input:
%           rank_r := discussing rank
%           R := the current group opinion (N*K)
% Output:
%           is_same := whether the group has reach concensus over the item that should be of rank_r

function is_same = helperRankIConcensusChecker(rank_r, R)
    indices_rank_r = helperFindItemsRanked_as_r(rank_r, R);
    is_same = all(indices_rank_r == indices_rank_r(1));
end

%% Test PASS
% A =
% 
%      4     1     2     3
%      4     2     3     1
%      4     3     1     2
% 
% helperRankIConcensusChecker(4, A)
% 
% ans =
% 
%   logical
% 
%    1
% helperRankIConcensusChecker(1, A)
% 
% ans =
% 
%   logical
% 
%    0
