function newImage = merge(euPath, dlPath,originalPath, filterPath, pp, thickness, strength)
%This enhanced the edges
%   Inputs
%   eupath : Path of Eulerian generated image
%   dlPath : Path of Dl genereated image
%%
eu = imread(euPath);
dl = imread(dlPath);
% fi = imread(filterPath);
or = imread(originalPath);

% fi = rgb2gray(fi);
% level = graythresh(fi);
% % disp(level);
% im = imbinarize(fi, level);
% 
% % imshowpair(im, or, 'montage');
% gray_eu = rgb2gray(eu);
% sobel_eu = edge(gray_eu, 'sobel');
% sobel_eu = imdilate(sobel_eu, strel('disk',thickness));
% 
% im = imdilate(im, strel('disk',25));
% new_filter = sobel_eu & ~im;
new_filter = pp;
% imshowpair(fi, new_filter,'montage');

filter3d = repmat(new_filter,1,1,3);
% newImage = zeros(size(eu));
or_hsv = rgb2hsv(or);
dl_hsv = rgb2hsv(dl);
eu_hsv = rgb2hsv(eu);

eu = hsv2rgb(eu_hsv);
or = hsv2rgb(or_hsv);
dl = hsv2rgb(dl_hsv);
% newImage(filter3d) = dl(filter3d);
% newImage(~filter3d) = or(~filter3d);
%blurring tryout

newImage = dl.*filter3d + or.*(1-filter3d);

% imshow(newImage);
% 
% 
% sobel_eu_3d = repmat(sobel_eu,1,1,3);
% eu_hsv = rgb2hsv(eu);
% dl_hsv = rgb2hsv(dl);
% dl = hsv2rgb(dl_hsv);
% eu_hsv(:, :, 2) = eu_hsv(:, :, 2) * strength;
% eu_hsv(eu_hsv>1) = 1;
% eu_rgb_enhanced = hsv2rgb(eu_hsv);
% newImage = zeros(size(eu));
% newImage(sobel_eu_3d) = eu_rgb_enhanced(sobel_eu_3d);
% newImage(~sobel_eu_3d) = dl(~sobel_eu_3d);
% imshow(newImage);


end