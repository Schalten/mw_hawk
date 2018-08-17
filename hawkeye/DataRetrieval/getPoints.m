% Generate points to test in the acceptable area
% 32x32 = 1024 points will be generated
s = 32;
lat=linspace(42.268611,42.278056,s);
lon=linspace(-71.396944,-71.3825,s);

% Concatenate latitude and longitude for api input
latStr = string(lat);
lonStr = string(lon);
points = repmat(latStr',1,s) + "," + repmat(lonStr,s,1);

% Reshape to a column vector
pointsInRadius = reshape(points,s^2,1);