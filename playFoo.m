%% Play Foo simulates a game of FOO!! %%

%bigWinner is the name of the Player who won the game
%numTurns is an integer value indicating how many turns the game took
%scoreBoard reports the score of each player

%numPlayers is an integer value indicating number of players in the game
%playerVector is a vector containing strings of player names to refer to different strategy programs


function [numTurn, playerScores, winnerScore, winnerIndex] = playFoo(playerNames)

% clc

numPlayers = length(playerNames);
turnOrder = randperm(numPlayers);                       %Randomizes turn order

playerIsIn = zeros(1, numPlayers);                      %All players initialized to 0, need to roll in
playerScores = zeros(1, numPlayers);                    %All scores initially set to 0

numTurn = 1;


while max(playerScores(numTurn,:))<5000              %Tests to be sure all players are below 5000pts

       
%Index through all players turns, turnIndex will be used to refer to the column of the matrix to update / refer to
    for turnIndex = turnOrder                                 
        
        whosTurn = playerNames(turnIndex);          %Use turnOrder and playerNames to figure out whos turn it is and dispaly name
        areTheyIn = playerIsIn(turnIndex);          %Pull value for whether player is in or not
        
%         fprintf('\n \n%s is up next \n', whosTurn)
        
        %% Execute Players Turn
        [playerScores, areTheyIn] = takeTurn(areTheyIn, playerScores, whosTurn, numTurn, turnIndex);  
        
        playerIsIn(turnIndex) = areTheyIn;              %Updates whether player has rolled in yet
        
%         pause
        
        
    end
    
    displayMatrix = [playerNames; playerScores];
%     fprintf('\n \n \n Current Scores \n')
%     disp(displayMatrix)
    %disp([' '; ' '; playerNames ; playerScores])
    
    playerScores = [playerScores; playerScores(numTurn,:)];  %each turn, initiate a new row of playerScores so the final value can be referred to and updated for this turn  
    numTurn = numTurn + 1;

end

playerScores(numTurn,:) = [];
numTurn = numTurn - 1;                                  %Total turns it took to play the game is one fewer than index counter

%Find out who was the winner and winning score
[winnerScore, winnerIndex] = max(playerScores(numTurn,:));  
winnerBitch = playerNames(winnerIndex);

% fprintf('big winner is %s with %f points after %f turns\n\n', winnerBitch, winnerScore, numTurn)



end

  





