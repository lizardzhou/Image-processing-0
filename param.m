%param.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

img = double(imread('lena.png')); %load the color image
img_g = double(imread('lena_unknown.png')); %load the gray image

matrix = [img(1,1,1) img(1,1,2); %red and green values of pixels (1,1)...
          img(512,1,1) img(512,1,2)]; %... and (512,1)
gray = [img_g(1,1);img_g(512,1)]; %gray values of pixcels (1,1) and (512,1)

coeff = matrix \ gray; %caculation of 2 coefficients
coeff(3) = 1 - coeff(1) - coeff(2); %calculation of the third coefficient using sum of 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Xiye Zhou
