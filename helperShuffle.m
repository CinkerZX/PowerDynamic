%% Shuffle the order of two items
% Input: 
%           inividualRank := the original opinon (1*K)
%           swap_positions := the positions of the two ranks need to swap
% Output:
%           the updated rank
function inividualRank = helperShuffle(inividualRank, swap_positions)
    temp = inividualRank(swap_positions(1));
    inividualRank(swap_positions(1)) = inividualRank(swap_positions(2));
    inividualRank(swap_positions(2)) = temp;
end