%% you Play foo like a big ole doint %%



function [keepRolling] = you(turnScore, playerScores, diceRemaining, numTurn, turnIndex)

fprintf('your current roll is %f and you have %f dice remaining', turnScore, diceRemaining)

keepRolling = input('Keep Rolling?');


end
