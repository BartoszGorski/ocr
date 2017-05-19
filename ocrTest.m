clc, close all, clear all

% Read image
image=imread('DSC_3.JPG');

% Resize image
image=imresize(image, 0.3);

% Show image
figure(101);
imshow(image);
title('Original image');
       
% % Add noise to the image
% image = imnoise(image,'gaussian',0,0.05);
% figure(1);        
% imshow(image);
% title('image with noise');

% Convert to gray scale
if size(image,3)==3 %RGB image
%     image=changeToGray(image);
    image=rgb2gray(image);
end
figure(2);
imshow(image);
title('image gray scale');

% use median filter
image = medfilt2(image,[2 2]);
figure(3);
imshow(image);
title('image with median filter');

% % use wiener filter
% image = wiener2(image,[5 5]);
% figure(3);
% imshow(image);
% title('image with wiener filter');

% use adaptive histogram equalisation
image = adapthisteq(image,'ClipLimit',0.003);
figure(4);
imshow(image);
title('image with histogram equalisation');

% contrast stretching
image = imadjust(image);
figure(5);
imshow(image);
title('contrast stretching');
              
% Convert to BW    
threshold = graythresh(image)
%figure(6);
%imshow(image);
image =~im2bw(image,threshold);
figure(7);
imshow(image);
title('convert to BW');

% se = strel('square',4);
% image = imopen(image,se);
% figure(8);
% imshow(image);
% title('Morphologically open image with structuring element - square 4x4');
                        
% Remove all object containing fewer than 10 pixels
image = bwareaopen(image,10);
figure(9);
imshow(image);
title('Remove all object containing fewer than 10 pixels');

% [image, rect] = imcrop(image);
% figure(10);
% imshow(image);
