%% Roll Dice Function inputs N number of dice to be rolled and outputs vector of leng N with random integers from 1-6 %

%diceRemaining - integer indicating how many dice remain
%currentRoll - vector of rand integers 1-6


function [currentRoll] = rollDice(diceRemaining)

currentRoll = randi([1 6],1,diceRemaining);


end