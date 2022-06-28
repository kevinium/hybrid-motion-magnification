function [] = frames2video(pathInput, path)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%%
% obj = VideoReader(pathInput);
imageNames = dir(fullfile(path,'*.png'));
imageNames = {imageNames.name};

outputVideo = VideoWriter(fullfile(path,'outFinal.avi'));
outputVideo.FrameRate = 30;

open(outputVideo)
for ii = 1:length(imageNames)
   img = imread(fullfile(path,imageNames{ii}));
   writeVideo(outputVideo,img)
end
end