%% chaz Plays foo like a prince %%
% chaz will stop rolling anytime they can take more than 350 points with fewer than 3 dice
% remaining to roll



function [keepRolling] = chaz(turnScore, playerScores, diceRemaining, numTurn, turnIndex)

currentMaxScore = max(playerScores(numTurn,:)); 
yourCurrentScore = playerScores(numTurn, turnIndex) + turnScore;

if (currentMaxScore > 4999 && yourCurrentScore < currentMaxScore)
    
    keepRolling = 1;
    
elseif turnScore > 350 && diceRemaining < 3
    
    keepRolling = 0;
    
else 
    
    keepRolling = 1; 

end




end
