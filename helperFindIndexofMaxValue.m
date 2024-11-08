%% This function is to return the id of which corrosponds to the max value
% |  id | value |
% Input: id_valueTable
% Output: id_maxValue
function idMax = helperFindIndexofMaxValue(id_valueTable)
    max_val = max(id_valueTable(:,2));
    max_indices = id_valueTable(:,2) == max_val;

    allidMax = id_valueTable(max_indices,1);
    idMax = allidMax(randi(length(allidMax)));
end

%% Test   PASS
% ids = [1, 3, 5, 7, 9];
% values = [2 4 4 7 7];
% id_valueTable = [ids', values'];
% disp(id_valueTable);
% id_valueTable =
% 
%      1     2
%      3     4
%      5     4
%      7     7
%      9     7
% idMax = helperFindIndexofMaxValue(id_valueTable);
% disp(idMax)
% idMax =
% 
%      7