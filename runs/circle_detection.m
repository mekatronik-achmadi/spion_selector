function [xc yc] = circle_detection(Xc,threshold)

Xc = bwareaopen(Xc,200);
[B,L] = bwboundaries(Xc,8,'noholes');
stats = regionprops(L,'Area','Centroid');

% loop over the boundaries
for k = 1:length(B)
  % obtain (X,Y) boundary coordinates corresponding to label 'k'
  boundary = B{k};
  % compute a simple estimate of the object's perimeter
  delta_sq = diff(boundary).^2;
  perimeter = sum(sqrt(sum(delta_sq,2)));
  % obtain the area calculation corresponding to label 'k'
  area = stats(k).Area;
  % compute the roundness metric
  metric = 4*pi*area/perimeter^2;
  % mark objects above the threshold with a red circle
  if metric > threshold
    centroid = stats(k).Centroid;    
  end
end

xc = round(centroid(1));
yc = round(centroid(2));