%% This function is to find column indices
% eg: matrix
% | item1 | item2 | irem3 |
% |    1     |    3     |    2    |
% |    2     |    3     |    1    |
% |    2     |     1    |    3    |
% to find the items of ranking 1, we get [1; 3; 2]
% Input:
%           rank_r := discussing rank
%           R := the current group opinion (N*K)
% Output:
%           id_of_items_at_rank_r := N agent's idea about which item should be ranked as r.   N*1       

function id_of_items_at_rank_r = helperFindItemsRanked_as_r(rank_r, R)
    % Create a logical matrix where elements equal to rank_r are marked as true
    logical_matrix = (R == rank_r);

    % Find the column indices of rank_r in each row
    [~, id_of_items_at_rank_r] = max(logical_matrix, [], 2);
end

% Test PASS