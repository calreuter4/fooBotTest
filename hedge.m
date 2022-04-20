%% hedge Plays foo like a real dummy %%



function [keepRolling] = hedge(turnScore, playerScores, diceRemaining, numTurn, turnIndex)


currentMaxScore = max(playerScores(numTurn,:)); 
yourCurrentScore = playerScores(numTurn, turnIndex) + turnScore;

if (currentMaxScore > 4999 && yourCurrentScore < currentMaxScore)
    
    keepRolling = 1;
    
elseif turnScore > 900 && diceRemaining < 6
    
    keepRolling = 0;
    
else 
    
    keepRolling = 1; 

end




end
