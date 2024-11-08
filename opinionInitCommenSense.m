%% This function is to initiate group opinions with common sense
% Input:
%           N := the group size
%           K := the number of items need to evaluate
%           top_k := the most important k items (top_k <= K)
%           num_top_swaps := the number of swaps among the top_k (an integer)
% Output:
%           R := the initial opinion of male. size: N * K

function R = opinionInitCommenSense(N, K, top_k, num_top_swaps)
    % Step 1: Define a base ranking (1, 2, ..., K)
    base_ranking = 1:K;
    
    % Step 2: Pre-allocate the matrix
    R = zeros(N, K);
    
    % Step 3: Generate each person's evaluation
    for i = 1:N
        num_top_swaps = max(1, num_top_swaps); % the higher the variety is, the more swaps will be
        % Ini individual rank
        indi_rank = base_ranking;

        for j = 1:num_top_swaps    
            % Shuffle the top_k items slightly
            % Choose two random positions within the top_k items to swap
            swap_positions = randperm(top_k, 2);
            indi_rank = helperShuffle(indi_rank, swap_positions);
        end
        
        % Step 2: Shuffle the less important items (top_k+1, top_K+2, ..., K)
        less_important_positions = top_k+1:K;
        indi_rank(less_important_positions) = indi_rank(less_important_positions(randperm(length(less_important_positions))));
        
        % Step 3: Perform additional shuffling between the "most important"
        % in less important and "the least important" in the more important
        if (rand<0.5) % 50% chance shuffle
            least_important_of_more_important_pos = find(indi_rank == top_k);
            most_important_of_less_important_pos = find(indi_rank == top_k+1);
            indi_rank = helperShuffle(indi_rank, [least_important_of_more_important_pos, most_important_of_less_important_pos]);
        end


        % Assign the modified ranking to the evaluation matrix
        R(i, :) = indi_rank;   % 1*K
    end
end

% Test PASS