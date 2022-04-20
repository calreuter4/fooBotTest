%% orms Plays foo with some big brains %%



function [keepRolling] = orms(turnScore, playerScores, diceRemaining, numTurn, turnIndex)


currentMaxScore = max(playerScores(numTurn,:)); 
yourCurrentScore = playerScores(numTurn, turnIndex) + turnScore;

scoreDelta = abs(currentMaxScore - yourCurrentScore); 

%Create threshold based on game parameters

threshold = turnScore*(scoreDelta/2000)/diceRemaining;


if (currentMaxScore > 4999 && yourCurrentScore < currentMaxScore)
    
    keepRolling = 1;
    
elseif threshold > 29.9
    
    keepRolling = 0;
    
else 
    
    keepRolling = 1; 

end




end
