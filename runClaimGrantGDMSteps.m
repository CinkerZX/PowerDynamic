%% This function is to run the group decision making progress
% Input:
%           N := total amount of agents
%           Female_rate := gender rate; 
%           K := the total number of items
%           k := the number of items that need to discuss
%           p := influence radius
%           T := termination time step
%           claiming_adjust := N*2  | claim increament | claim decreament |
%           granting_adjust := N*2  | claim increament | claim decreament |
% Output:
%           dyn_R := N*N*(T+1)
%           dyn_Tc := N*N*(T+1)
%           dyn_Tc := N*N*(T+1)

function [dyn_R, dyn_Tc, dyn_Tg] = runClaimGrantGDMSteps(N, K, k, p, T, claiming_adjust, granting_adjust)
    global R Tc Tg memoryAgent_indices % R, Tc, Tg, the value at the moment
    memorySpace = 7; % Memory space of each agent, which item should be of rank_k
    % | item1 | item2 | item3 | item4 | item5 | .... | item_memorySpace |
    % item 1 is the agent's own opinion, which is updated, the rest are
    % from claims, if there are more new item, then the oldest information
    % will be squeezed out

    % ini output
    dyn_R = zeros(N, N, T+1);
    dyn_Tc = zeros(N, N, T+1);
    dyn_Tg = zeros(N, N, T+1);
    
    dyn_R(:,:,1) = R;
    dyn_Tc(:,:,1) = Tc;
    dyn_Tg(:,:,1) = Tg;

    t = 1;
    ids = [1:1:N]';
    for i = 1:k % which item should be of rank i = 1, 2, ..., k
        % ini memory space
        memoryAgent = zeros(N, memorySpace);
        memoryAgent(:, 1) = helperFindItemsRanked_as_r(i, R); % the first one is the agent's own opinion
        memoryAgent_indices = ones(N,1)'+1; % where to insert new claims, start from 2

        if (t <= T) % no consensus over i
            %% discuss
            counter_claim = 0;
            while(~helperRankIConcensusChecker(i, R))
                % Step1: select the claimer
                if (counter_claim = 0) % condition1: claimer is a initiating claimer who first propose
                    idClaimer = helperClaimerSelection(Tc, ids, 0);
                else % condition2: claimer is a counter_claimer
                    idClaimer = helperCounterClaimerSelection();
                end
                
                % Step2: select listeners
                idListeners = helperListenerSelection(idClaimer, N, p); % size: num_of_Listeners*1
    
                % Step3: memory space update and R update
                memoryAgent = updateMemory_R(memorySpace, i, memoryAgent, idListeners, idClaimer);
                % ************************************
    
                % Step5: check consensus over i
    
                % Step6: select responder
                % if grant
                % if counter-claim
                counter_claim = 1;
    
                % Step7: memory space update
                memoryAgent = updateMemory(memoryAgent, idListeners, idClaimer);
                % ************************************
    
                % Step8: update R
            end
        elseif helperRankIConcensusChecker(i, R)
            i = i+1;
        else
            % hit the termination time, aggregate the R
            break;
        end
    end
end
