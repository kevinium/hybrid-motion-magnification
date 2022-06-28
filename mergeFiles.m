function mergeFiles(eu_folder_path,dl_folder_path, filter_folder_path, original_folder_path, output_path)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% section 1
eu = dir(eu_folder_path);
dl = dir(dl_folder_path);
fi = dir(filter_folder_path);
or = dir(original_folder_path);
fp = imread(strcat(fi(3).folder,"/",fi(3).name));
fp = rgb2gray(fp);
level = graythresh(fp);
% disp(level);
% im = imbinarize(fp, level);
% filter = im;
% for i=3:303
%     fi_path = strcat(fi(i).folder,"/",fi(i).name);
%     fp = imread(fi_path);
%     fp = rgb2gray(fp);
%     level = graythresh(fp);
%     im = im & imbinarize(fp, level);
% end
%% section2

for i=3:303

    fi_path = strcat(fi(i).folder,"/",fi(i).name);

for i=3:303
    eu_path = strcat(eu(i).folder,"/",eu(i).name);
    dl_path = strcat(dl(i).folder,"/",dl(i).name);
    fi_path = strcat(fi(i).folder,"/",fi(i).name);
    or_path = strcat(or(i).folder,"/",or(i).name);
    disp(dl_path);

    out_frame = Copy_of_merge(eu_path, dl_path,or_path, fi_path, 1, 1);
    imwrite(out_frame, strcat(output_path, "/", eu(i).name));

end