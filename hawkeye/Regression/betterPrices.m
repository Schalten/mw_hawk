
function bpTable = betterPrices(trainedModel, possibleSpotTable, defaultPrice)
% predict price values from model
for i = 1: height(possibleSpotTable)
    possibleSpotTable(i,7) = {trainedModel.predict(possibleSpotTable(i, :))};
end
% sort table by price
possibleSpotTable = sortrows(possibleSpotTable, 7);
% grab prices less than or equal to default drop off price
bpTable = possibleSpotTable(possibleSpotTable.(7) <= defaultPrice, :);
% write the price table to a file bestPrices
writetable(bpTable, 'bestPrices.csv');
end
    