%% fooPlayer loops through x number of foo games
clear 
clc

%% Available players
% you - play a live game you loser
% chaz - stops with > 350 points, < 3 dice
% hedge - stops with > 900 points, < 6 dice
% dong - stops with > 200 points, < 6 dice
% orms - threshold value > X

playerNames = ["chaz" "hedge" "dong" "orms"];

numPlayers = length(playerNames); 

%Number of games to play
numGames = 1000;

%Initialize game outputs
playerScores = {}; 
allScores = [];
numTurn = zeros(1, numGames); 
endingScores = [];
averageRoundScore = zeros(1, numPlayers);
averageTurnScore = zeros(1, numPlayers);
medianTurnScore = zeros(1, numPlayers);
winnerMatrix = zeros(numGames, numPlayers); 



%% Run as many games as you like
for i = 1:numGames
    
    %Execute playgame code
    [numTurn(i), playerScores{i}, winnerScore, winnerIndex] = playFoo(playerNames);
    
    %Create matrix of just the final player scores
    endingScores = [endingScores; playerScores{i}(numTurn(i),:)];
    
    %Create matrix populated with 1's to indicate which player position won each game, total 1s
    %equals iterations
    winnerMatrix(i,winnerIndex) = 1;
    
    allScores = [allScores; playerScores{i}];
    
end





for k = 1:numPlayers
   
    averageRoundScore(k) = round(mean(endingScores(:,k)));
    averageTurnScore(k) = round(mean(allScores(:,k)));
    medianTurnScore(k) = median(allScores(:,k));
    totalWins(k) = sum(winnerMatrix(:,k));
    winRate(k) = round(totalWins(k)*100/numGames);
    
end

averageNumTurns = mean(numTurn);
gameStats = [" " playerNames; "avg. round score" averageRoundScore; "avg. turn score" averageTurnScore; ...
    "median turn score" medianTurnScore; "total wins" totalWins; "win percentage" winRate];

fprintf('\nGames played = \n')
disp(numGames)

fprintf('\nAverage number of turns per game\n')
disp(averageNumTurns)

fprintf('\nPlayer Stats:\n')
disp(gameStats)

