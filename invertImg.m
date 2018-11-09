function [B] = invertImg(A)
%INVERTIMG  Invert colors of image
%   B = INVERTIMG(A) inverts the 8-bit color or grayscale image A.
%
%   See also imcomplement.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

red = double(A(:,:,1));
green = double(A(:,:,2));
blue = double(A(:,:,3));

red_neg = 255*ones(size(A(:,:,1))) - red;
green_neg = 255*ones(size(A(:,:,2))) - green;
blue_neg = 255*ones(size(A(:,:,3))) - blue;
negImg = cat(3,red_neg,green_neg,blue_neg);

B = uint8(negImg);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Xiye Zhou
