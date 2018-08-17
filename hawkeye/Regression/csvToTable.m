
% read the csv file into a table variable
Table = readtable('allisonsResults2.csv', 'Filetype', 'text', 'ReadVariableNames', false);
% assign names to the variables
varnames = {'walkingDistance'; 'walkingTime'; 'elevationChange'; 'hasUnpaved'; 'longitude'; 'latitude';' price'};
Table.Properties.VariableNames = varnames;
% price and walking distance were imported as cells for some reason,
% converting them to doubles
Table.price = str2double(Table.(7));
Table.walkingDistance = str2double(Table.(1));
% create a gaussian model of the table
Mdl = fitrsvm(Table,'price','KernelFunction','gaussian','KernelScale','auto',...
    'Standardize',true)