%Simple way we can get the data from Excel back into Matlab

filename= "Data.xlsx";

[status,sheets] = xlsfinfo(filename) %Gets the data for the sheets and then passes them further

%Is date in the first column? If yes it needs to be in Excels format

date = false; % Can only take the true or false

sto = cell(size(sheets,2),1); % Predefine the data-box

%Gets all the numberical data from the sheets
for i = [1:1:size(sheets,2)]
    num(:,:) = xlsread(filename,char(sheets(i))); % range as the optional argument afterwards
    sto(i,1) = {num};
    clear num
end 

sto' %Transposing the data

% % We will want to do the date conversion, only if the data is in the data
% 
% if date == true ;
% 
%     for i = [1:1:sheet]
%        num(:,1,i) = x2mdate(num(:,1,i))
%     end 
% 
% end
% 
%     date = date + 1; 
% 
% %Need to predefine the array of the same size as the numbers one
% 
% replace='previous';
% 
% %We replace the NaNs with the previous values of the set
% 
% num2 = randn(size(num,1),size(num,2),size(num,3)) 
% 
% for i = [1:1:sheet]
%     num2(date:end,:,i) = fillmissing(num(date:end,:,i), replace);
% end 
% 
% %Next we want to indeify the number of outliers 
% method = 'median';
% 
% for i = [1:1:sheet]
%     num2(date:end,:,i) = isoutlier(num(date:end,:,i),method);
% end 
% 
% % Gives the number of problematic cells for each of the sheet seperately
% for i = [1:1:sheet]
%     nnz(num2(date:end,:,i))
% end 