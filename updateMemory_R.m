%% This function is to update listeners memory and their opinion
% 

function updateMemory_R(memorySpace, i, memoryAgent, idListeners, idClaimer)
    global R % N*K
    global memoryAgent_indices % N*1

    % Insert the claimed item into the memory space of Listeners
    item = R(idClaimer, i); % a value in [1, K]
    

    indices_of_momery_Listeners = memoryAgent_indices(idListeners);
    momoryAgent(idListeners, indices_of_momery_Listeners) = item;

    % update memoryAgent_indices
    memoryAgent_indices(idListeners) = mod(memoryAgent_indices(idListeners), memorySpace) + 1;
    
    %% update listener's opinion
    % Step 1: Replace zeros with NaN to ignore them in calculations
    % **************************************** Listeners origional idea;
    % listeners new idea, listener change their idea in R
    A_no_zeros = memoryAgent(idListeners);
    A_no_zeros(memoryAgent(idListeners) == 0) = NaN;
    
    % Step 2: Calculate most frequent value for each row, ignoring NaN values
    row_modes = mode(A_no_zeros, 2, 'omitnan');
    
    % Step 3: Calculate frequency of the mode in each row
    mode_counts = sum(A_no_zeros == row_modes, 2, 'omitnan');
    
    % Step 4: Use the first element directly if there is no clear most frequent value
    % Initialize result with row_modes
    newOpinion = row_modes;

    % The id of listeners who need to update their opinion
    idListeners()
    
    % For rows where the mode count is 1, use the first element in the row
    newOpinion(mode_counts == 1) = memoryAgent(mode_counts == 1, 1);
    
    % 
end