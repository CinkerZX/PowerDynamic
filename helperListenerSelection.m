%% This function is to select listeners
% Input:
%           idClaimer := id of the claimer
%           N := total amount of agents
%           p := influence radius
% Output:
%           idListeners: num_of_Listeners*1
function idListeners = helperListenerSelection(idClaimer, N, p)
    ids = [1:1:N]';
    num_listeners = round(N*p);
    
    pool = ids(ids(:)~=idClaimer);
    idListeners = pool(randperm(num_listeners));
end

% Test PASS