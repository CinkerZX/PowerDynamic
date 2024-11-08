%% This function is to select the claimer out of ids
% Input:
%           currTc := the current Tc matrix N*N
%           ids := the pool where the claimer select from numListener*1
%           idLastClaimer := the id of the claimer who just made a claim
% Output:
%           idClaimer :=  the selected claimer
function idClaimer = helperClaimerSelection(currTc, ids, idLastClaimer)    
    if idLastClaimer == 0 % no previous claimer
        % use the average Tc
        val_Tc = mean(currTc,2);
    else
        % use the tendency to counter_claim against the LastClaimer
        val_Tc = currTc(:, idLastClaimer);
    end
    idPool_Tc  = val_Tc(ids);
    id_valueTable = [ids, idPool_Tc];
    idClaimer = helperFindIndexofMaxValue(id_valueTable);
end

%%Test PASS
% currTc
% 
% currTc =
% 
%     0.5000    0.5000    0.5000
%     0.5000    0.5000    0.5000
%     0.5000    0.5000    0.5000
% 
% ids
% 
% ids =
% 
%      1
%      2
%      3
% 
% idLastClaimer
% 
% idLastClaimer =
% 
%      0
% idClaimer = helperClaimerSelection(currTc, ids, idLastClaimer);
% idClaimer
% 
% idClaimer =
% 
%      3
% 
% idClaimer = helperClaimerSelection(currTc, ids, idLastClaimer);
% idClaimer
% 
% idClaimer =
% 
%      1
% 
% idClaimer = helperClaimerSelection(currTc, ids, idLastClaimer);
% idClaimer
% 
% idClaimer =
% 
%      2