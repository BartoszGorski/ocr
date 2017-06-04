clc, close all, clear all

% Read image
image=imread('photos/DSC_1.JPG');

% Resize image
image=imresize(image, 0.3);

% Show image
figure(1);
imshow(image);
title('Original image');

% Add noise
image = imnoise(image,'salt & pepper',0.008);
figure(2);        
imshow(image);
title('image with noise');

% Convert to gray scale
if size(image,3)==3 %RGB image
    image=changeToGray(image);
end
figure(3);
imshow(image);
title('Image gray scale');

% use median filter
image = medianFilter(image, 3, 60);
figure(4);
imshow(image);
title('image with median filter');

% use adaptive histogram equalisation
% image=histeq_own(image);
image=adapthisteq(image,'ClipLimit',0.003);
figure(5);
imshow(image)
title('image with histogram equalisation');

% contrast stretching
% image = imadjust(image,[0.15 0.48],[]);
% image = imadjust(image,stretchlim(image),[]);
image = contrastStr(image,40,0,100,215);
figure(6);
imshow(image);
title('contrast stretching');


