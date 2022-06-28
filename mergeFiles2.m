function mergeFiles2(eu_folder_path,dl_folder_path, filter_folder_path, original_folder_path, output_path, strength, smoothness)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% section 1
eu = dir(eu_folder_path);
dl = dir(dl_folder_path);
fi = dir(filter_folder_path);
or = dir(original_folder_path);
disp(strcat(fi(3).folder,"/",fi(3).name));
fp = imread(strcat(fi(3).folder,"/",fi(3).name));
fp = rgb2gray(fp);
% disp(level);
im =zeros(size(fp));

for i=3:291
    
    fi_path = strcat(fi(i).folder,"/",fi(i).name);
    fp = imread(fi_path);
    fp = fp(:,:,1);
%     fp = rgb2gray(fp);
    fp = double(fp);
    im = im + fp;

    
    
end
im = im/292;
im = uint8(im);

% imshow(im);
level = graythresh(im);
im = imbinarize(im, level);

im = imdilate(im, strel('disk',strength));
% imshow(im)
%blurring try out
windowSize = smoothness;
kernel = ones(windowSize) / windowSize ^ 2;
blurryImage = conv2(single(im), kernel, 'same');
imshow(blurryImage);
%% section2



for i=3:289
    eu_path = strcat(eu(i).folder,"/",eu(i).name);
    dl_path = strcat(dl(i).folder,"/",dl(i).name);
    fi_path = strcat(fi(i).folder,"/",fi(i).name);
    or_path = strcat(or(i).folder,"/",or(i).name);
    disp(dl_path);

    out_frame = merge2(eu_path, dl_path,or_path, fi_path,blurryImage, 1, 1);
    imwrite(out_frame, strcat(output_path, "/", eu(i).name));

end