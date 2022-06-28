function newImage = merge(euPath, dlPath, thickness, strength)
%This enhanced the edges
%   Inputs
%   eupath : Path of Eulerian generated image
%   dlPath : Path of Dl genereated image
%%
eu = imread(euPath);
dl = imread(dlPath);
gray_eu = rgb2gray(eu);
sobel_eu = edge(gray_eu, 'sobel');
sobel_eu = imdilate(sobel_eu, strel('disk',thickness));


sobel_eu_3d = repmat(sobel_eu,1,1,3);
eu_hsv = rgb2hsv(eu);
dl_hsv = rgb2hsv(dl);
dl = hsv2rgb(dl_hsv);
eu_hsv(:, :, 2) = eu_hsv(:, :, 2) * strength;
eu_hsv(eu_hsv>1) = 1;
eu_rgb_enhanced = hsv2rgb(eu_hsv);
newImage = zeros(size(eu));
newImage(sobel_eu_3d) = eu_rgb_enhanced(sobel_eu_3d);
newImage(~sobel_eu_3d) = dl(~sobel_eu_3d);
% imshow(newImage);


end