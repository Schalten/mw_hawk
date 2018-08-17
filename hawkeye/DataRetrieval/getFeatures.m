% Retrieve feature information about points in acceptable area
directionsApi = 'http://open.mapquestapi.com/directions/v2/route?key=qO5HBuGkpGCJZmyRkErbNK2yj5gF8pUh&from=';
elevationApi = 'http://open.mapquestapi.com/elevation/v1/profile?key=qO5HBuGkpGCJZmyRkErbNK2yj5gF8pUh&shapeFormat=raw&latLngCollection=';

% Original destination is the Kendall Crossing apartments
origin = '42.278056,-71.389722';
url = [elevationApi origin];
S = webread(url);
originElevation = S.elevationProfile.height;

numPoints = length(pointsInRadius);

% distance, time, elevation, hasunpaved, hashighway, hasseasonalclosure
features = zeros(numPoints,6);
for k=1:numPoints
    coord = convertStringsToChars(pointsInRadius(k));
    url = [directionsApi origin '&to=' coord '&routeType=pedestrian'];
    S = webread(url);
    
    features(k,1) = S.route.distance;
    features(k,2) = S.route.time;
    features(k,4) = S.route.hasUnpaved;
    features(k,5) = S.route.hasHighway;
    features(k,6) = S.route.hasSeasonalClosure;
    
    url = [elevationApi origin ',' coord];
    S = webread(url);
    
    field=extractfield(S.elevationProfile,'height');
    features(k,3) = field(2) - originElevation;
end