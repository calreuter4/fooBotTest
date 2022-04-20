%% Generic Function to allow players to take their turn rolling dice %%





function [playerScores, areTheyIn] = takeTurn(areTheyIn, playerScores, whosTurn, numTurn, turnIndex)


if areTheyIn == 1 
    
    %% Player has already rolled in, initialize turn to 0 points and 6 dice and let it rip
    keepRolling = 1;
    diceRemaining = 6; 
    turnScore = 0; 
    
    while keepRolling == 1
       
        currentRoll = rollDice(diceRemaining);                   %Roll remaining dice
        
        [rollValue, diceRemaining] = scoreDice(currentRoll);    %Update score for dice rolled
        
        
        if rollValue == 0                                       %BUST ROLL
            keepRolling = 0; 
            turnScore = 0;
            
%             fprintf('BUST\n')
            
        else     
            turnScore = turnScore + rollValue;
            keepRolling = feval(whosTurn, turnScore, playerScores, diceRemaining, numTurn, turnIndex);
        end
        
    end
    
    playerScores(numTurn, turnIndex) = playerScores(numTurn, turnIndex)+turnScore; 
      
%     fprintf('%s scored %f points \n \n', whosTurn,t urnScore)


else
    %% Player still needs to roll in
    
    areTheyIn = rollIn(); 
    if areTheyIn == 1
%         fprintf('%s is IN \n', whosTurn)
    else 
%         fprintf('%s is NOT in \n', whosTurn)
    end
    
end



end
