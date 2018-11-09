function [H] = calcHistogram(A)
%CALCHISTOGRAM  Calculate occurences of light intensities {0,...,255}
%   H = CALCHISTOGRAM(A) calculates array of occurences from intensity matrix A
%
%   See also histogram, histogram2, histcounts, histcounts2, imhist.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 img = imread(A); %read image from file
 
 if ndims(img) == 3 %in case of color image: split into 3 channels
     red = img(:,:,1); %red channel
     green = img(:,:,2); %green channel
     blue = img(:,:,3); %blue channel
     figure, imhist(red), title('Histogram for red channel') %histogram for red channel
     figure, imhist(green), title('Histogram for green channel') %histogram for green channel
     figure, imhist(blue), title('Histogram for blue channel') %histogram for blue channel
 else    %in case of greyscale image... 
     figure, imhist(img)
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Xiye Zhou
