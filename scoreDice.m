%% Funciton scoreDice inputs currentRoll vector of length N and outptus score value according to standard foo rules

% rollValue = total point value of roll
% diceRemaining = scalar value for dice that could be re-rolled if desired by player
% currentRoll = vector of values representing current dice roll 1xN

function [rollValue, diceRemaining] = scoreDice(currentRoll)

rollValue = 0;                               %initialize rollValue to 0 
numDice = length(currentRoll);               
rollSorted = sort(currentRoll);      
tripleFound = 0;

%% Check for Foo and Long Straight
if numDice == 6
    if rollSorted(1) == rollSorted(6)       %FOO !!
        rollValue = 5000;
%         rollSorted = []
        diceRemaining = 6;
%         numDice = length(rollSorted)
        return
    
    elseif isequal (rollSorted, [1 2 3 4 5 6])      %Large straight !!
        rollValue = 2500;
%         rollSorted = []
        diceRemaining = 6;
%         numDice = length(rollSorted)
        return
        
    end
    
end


%% Check for Triples
i=0;
while (numDice >2 && i < numDice-2)

    i = i+1;
    if rollSorted(i)==rollSorted(i+2)       %Test for triple number condition
        
        tripleFound = 1;
        if rollSorted(i) == 1
            rollValue = rollValue + 1000;
        else 
            rollValue = rollValue + rollSorted(i)*100;
        end

        rollSorted(i:i+2) = [];
        numDice = length(rollSorted);
        i=0;

        if numDice == 0
            diceRemaining  = 6;  
            return
        else 
            diceRemaining = numDice;
        end

    end


end

%% Check for 1's and 5's
anyOnes = ismember(rollSorted,1);        %Outputs 1x6 vector with logical 1's wherever 1 was present in roll vector
anyFives = ismember(rollSorted,5);       %Outputs 1x6 vector with logical 5's wherever 1 was present in roll vector

   
if sum(anyOnes)+sum(anyFives) == 0 && tripleFound == 0
    diceRemaining = 0;
    rollValue =  rollValue + 0;
else
    diceRemaining = numDice - (sum(anyOnes)+sum(anyFives));
    rollValue = rollValue + sum(anyOnes) *100;
    rollValue = rollValue + sum(anyFives) *50;
    if diceRemaining == 0 
        diceRemaining = 6;
    end
end
    


end 