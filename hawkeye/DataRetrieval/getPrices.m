% Retrieve the prices from all points in the acceptable area
% Our starting location is Apple Hill
lyftApi = 'https://api.lyft.com/v1/cost?start_lat=42.299463&start_lng=-71.351100';

% Our ending location is the Kendall Crossing apartments
% Ride type is Lyft
url = [lyftApi '&end_lat=42.278056&end_lng=-71.389722&ride_type=lyft'];
S = webread(url);

% Calculate price by taking the average of the min and max cost estimates
originalPrice = (S.cost_estimates.estimated_cost_cents_min + S.cost_estimates.estimated_cost_cents_max)/2;

% Other points
numPoints = length(pointsInRadius);
prices = zeros(numPoints,1);
for k=1:numPoints
    coord = convertStringsToChars(pointsInRadius(k));
    latlong = strsplit(coord,',');
    url = [lyftApi '&end_lat=' latlong{1} '&end_lng=' latlong{2} '&ride_type=lyft'];
    S = webread(url);
    prices(k) = (S.cost_estimates.estimated_cost_cents_min + S.cost_estimates.estimated_cost_cents_max)/2;
end