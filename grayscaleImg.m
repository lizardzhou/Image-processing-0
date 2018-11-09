function [B] = grayscaleImg(img,method)
%GRAYSCALEIMG  Convert RGB image to grayscale
%   B = GRAYSCALEIMG(A,METHOD) converts the RGB image to the grayscale 
%   intensity 8-bit image B using algorithm METHOD
%
%   METHOD is a string that may be:
%
%   METHOD         DESCRIPTION
%   'average'      use arithmetic mean of r, g and b value 
%   'luma'         sum weighted colors based on human eye reception
%   'desaturation' conversion RGB -> HSL and desaturate
%   'digicam'      use only green color channel
%   '4bit'         reduce bit depth to 4-bit and rescale to 8-bit
%   'unknown'      parameters based on example image 'lena_unknown.png'
%
%   See also rgb2gray.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  A = imread(img); %load image

  switch method %different methods
      case 'average'
          B = average(A);
      case 'luma'
          B = luma(A);
      case 'desaturation'
          B= desaturation(A);
      case 'digicam'
          B = digicam(A);
      case '16shades'
          B = shades(A);
      case 'unknown'
          B = unknown(A);
      otherwise
          disp('Please type one of the given methods!')
  end    

  imshow(B) %show image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

function [B] = average(A)
    red = A(:,:,1); %red channel
    green = A(:,:,2); %green channel
    blue = A(:,:,3); %blue channel    
    B = (red + green + blue) / 3; %average of r, g, b values
end

function [B] = luma(A)
    red = A(:,:,1);
    green = A(:,:,2);
    blue = A(:,:,3);    
    B = red .* 0.2126 + green .* 0.7152 + blue .* 0.0722;
end

function [B] = desaturation(A)
    red = A(:,:,1);
    green = A(:,:,2);
    blue = A(:,:,3);    
    max_value = max(max(red,green),blue); %maximum of (r,g,b)
    min_value = min(min(red,green),blue); %minimum of (r,g,b)
    B = (max_value + min_value) / 2;
end

function [B] = digicam(A)
    B = A(:,:,2); %extract the green channel
end

function [B] = shades(A)
    %calculate the averaged image values
    red = A(:,:,1); 
    green = A(:,:,2); 
    blue = A(:,:,3);   
    A_conv = (red + green + blue) / 3; 
    %calculate the 4bit image
    B = floor(A_conv / 17) * 17;
end

function [B] = unknown(A)
    red = A(:,:,1);
    green = A(:,:,2);
    blue = A(:,:,3);    
    param; %calculate the coeffcients using param.m
    B = red .* coeff(1) + green .* coeff(2) + blue .* coeff(3);
end

%by Xiye Zhou
