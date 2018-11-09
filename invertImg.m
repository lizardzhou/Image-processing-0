function [B] = invertImg(A)
%INVERTIMG  Invert colors of image
%   B = INVERTIMG(A) inverts the 8-bit color or grayscale image A.
%
%   See also imcomplement.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 img = imread(A); %read image from file
 B = imcomplement(img); %reverse image
 
 %Show reversed images:
 figure, imshow(B);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Xiye Zhou
