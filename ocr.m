clc, close all, clear all

% Read image
image=imread('DSC_3.JPG');

% Resize image
image=imresize(image, 0.3);

% Add noise
image = imnoise(image,'salt & pepper',0.05);
figure;        
imshow(image);
title('image with noise');

% Show image
figure;
imshow(image);
title('Original image');

% Convert to gray scale
if size(image,3)==3 %RGB image
    image=changeToGray(image);
end
figure(2);
imshow(image);
title('Image gray scale');

% use median filter
image = medianFilter(image, 3);
figure(3);
imshow(image);
title('image with median filter');

