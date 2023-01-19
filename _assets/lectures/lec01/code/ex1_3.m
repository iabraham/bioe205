% Example 1.3  Example to apply some mathematical and threshold operations 
%   to an MR image %  of the brain.  
 
clear all; close all;
load brain;         		% Load image   
subplot(2,2,1);             	% Display the images 2 by 2
pcolor(I);           		% Display original image 
colormap(bone);             	% Grayscale color map
caxis([0 1]);        		% Fix pcolor scale
title('Orignal Image');
 
subplot(2,2,2);
I1 = I + .3;			% Brighten the image by adding 0.3	
pcolor(I1);           		% Display original image 
colormap(bone);             	% Grayscale color map
caxis([0 1]);        		% Fix pcolor scale
title('Lightened');
 
subplot(2,2,3);
I1 = 1.75*I;			% Increase image contrast by multiplying by 1.75
pcolor(I1);           		% Display new image 
colormap(bone);             	% Grayscale color map
caxis([0 1]);        		% Fix pcolor scale
title('Contrast Enhansed');
 
subplot(2,2,4);
[r, c] = size(I);           	% Get image dimensions 
thresh = 0.25;			% Set threshold
for k = 1:r
    for j = 1:c
        if I(k,j) < thresh 	% Test each pixel separately
            I1(k,j) = 1;	% If low make corresponding pixel white (1)	
        else 	
            I1(k,j) = 0;	% Otherwise make it black (0) 
        end
    end
end
pcolor(I1);           		% Display new image 
colormap(bone);             	% Grayscale color map
caxis([0 1]);        		% Fix pcolor scale
title('Thresholded');       

