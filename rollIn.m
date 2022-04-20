%% rollIn function rolls 6 dice. Returns 1 if 1 or 5 are present, returns 0 if no 1s or 5s are present %
%No inputs required as the rollIn funciton is the same for all players

%isIn returns logical scalar 1 or 0 depending on whether player rolls 1 AND a 5

function [isIn] = rollIn()

currentRoll = randi([1 6],1,6);         %Generate roll vector

anyOnes = ismember(currentRoll,1);      %Outputs 1x6 vector with logical 1's wherever 1 was present in roll vector
anyFives = ismember(currentRoll,5);     %Outputs 1x6 vector with logical 5's wherever 1 was present in roll vector

if max(anyOnes)&& max(anyFives)         %Doesn't matter how many ones or 5s so we just take the max, if no 1's or 5's 0 will throw a false 
    isIn = 1;
else 
    isIn = 0;
end


end