%% PRELIMINARY WORK
%Loading the test data
data = load('test_reg.csv');

%Create a variable that includes the number of independent variables
var_number = size(data,2)-1;

%Create a list which specificies the number of variables we have
v = [1:1:var_number]; 

%Create a cell where all the combinations of variables will be stored
comb = cell(var_number,1);

%Here we have create a list of all the possible coombinations of items
for i = 1:1:size(v,2)
C = nchoosek(v,i);
comb(i) = {C};
end

%We unfortunatley cannot have sheet with different dimensions, so the sheet
%row number needs to equal to the maximum size, which is max size

[max_sizes] = max(cellfun('size', comb, 1));

%%Create a new cell, with the correct size to store regression values

A = cell(max_sizes,6,size(v,2)); %The number of parameters we pass is 6 because we have silenced some of the earlier arguments


%% HERE WE TEST ALL THE POSSIBLE REGRESSIONS

k=1; % Initialize the variable

while k <= C(1,end)
    
    for j = 1:1:size(comb{k},1)
        
        %Here you automatically assume the last variable is the response one
        [b,bint,~,~,stats] = regress(data(:,end),data(:,comb{k}(j,:)));

        A(j,1,k) = {b}; %The coefficients
        A(j,2,k) = {bint}; % 95 percent confience interval coefficients
        A(j,3,k) = {stats(1)}; % R^2
        A(j,4,k) = {stats(2)}; % F - value
        A(j,5,k) = {stats(3)}; % p - value 
        A(j,6,k) = {stats(4)}; % error of variance
        
    end

    k=k+1;
end 

%% NOW ANALYSIS OF REGRESSIONS

%Create a new array to find the best models

Best = zeros(size(comb,1),2);

for l=1:1:size(comb,1)
    [max_size, max_index] = max([A{:,3,l}]);
    Best(l,1) = max_size;
    Best(l,2) = max_index;
end

%Now we store the best models, so we can look at the into more details

Best_models = cell(size(comb,1),7); %The size here must be the same, last one will be for index

%Now we get the specifications of the best models

for l=1:1:size(comb,1)
    Best_models(l,1:6) = {A{Best(l,2),:,l}};
    %Append the index 
    Best_models(l,7) = {comb{l,1}(Best(l,2),:)} ;
end

