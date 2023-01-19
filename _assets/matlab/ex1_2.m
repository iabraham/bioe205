clear all, close all;
N = 100;        	% Number of pixels per line and number of lines
x = (1:N)/N;      	% Spatial vector
y = sin(8*pi*x);	% Four cycle sine wave		
for k = 1:N
    I(k,:) = y;		% Duplicate 100 times
end
pcolor(I);              % Display image
colormap(bone);      	% Use a grayscale color map

