%% Bloomberg connect app
% This app is meant to connect to the Bloomberg and export the data we
% need:

c = c = blp([],[],10000) % Connects to Bloomberg

v = isconnection(c) % This checks if the connection works and returns a binary

d = eqs(c,'Frontier Market Stocks with 1 billion USD Market Caps'); %Testing the connetion 

close(c); %Closes the connection from Bloomberg


%d = eqs(c,sname,stype,languageid,group)
