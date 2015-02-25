function addinfo(im1,im2,im3,im4,im5,im6)

[m n o] = size(im1);
if nargin < 2
    im2 = uint8(zeros(m,n,o));
    im3 = im2;
    im4 = im2;
    im5 = im2;
    im6 = im2;
elseif nargin < 3
    im2(:,:,1) = im2(:,:,1);
    im2(:,:,2) = im2(:,:,1);
    im2(:,:,3) = im2(:,:,1);
    im3 = uint8(zeros(m,n,o));
    im4 = im3;
    im5 = im3;
    im6 = im3;
elseif nargin < 4
    im2(:,:,1) = im2(:,:,1);
    im2(:,:,2) = im2(:,:,1);
    im2(:,:,3) = im2(:,:,1);    
    im3 = uint8(im3)*255;
    im3(:,:,1) = im3(:,:,1);
    im3(:,:,2) = im3(:,:,1);
    im3(:,:,3) = im3(:,:,1);
    im4 = uint8(zeros(m,n,o));
    im5 = im4;
    im6 = im4;
elseif nargin < 5
    im2(:,:,1) = im2(:,:,1);
    im2(:,:,2) = im2(:,:,1);
    im2(:,:,3) = im2(:,:,1);    
    im3 = uint8(im3)*255;
    im3(:,:,1) = im3(:,:,1);
    im3(:,:,2) = im3(:,:,1);
    im3(:,:,3) = im3(:,:,1);    
    im4 = uint8(im4)*255;
    im4(:,:,1) = im4(:,:,1);
    im4(:,:,2) = im4(:,:,1);
    im4(:,:,3) = im4(:,:,1);
    im5 = uint8(zeros(m,n,o));
    im6 = im5;
elseif nargin < 6
    im2(:,:,1) = im2(:,:,1);
    im2(:,:,2) = im2(:,:,1);
    im2(:,:,3) = im2(:,:,1);    
    im3 = uint8(im3)*255;
    im3(:,:,1) = im3(:,:,1);
    im3(:,:,2) = im3(:,:,1);
    im3(:,:,3) = im3(:,:,1);    
    im4 = uint8(im4)*255;
    im4(:,:,1) = im4(:,:,1);
    im4(:,:,2) = im4(:,:,1);
    im4(:,:,3) = im4(:,:,1);    
    im5 = uint8(im5)*255;
    im5(:,:,1) = im5(:,:,1);
    im5(:,:,2) = im5(:,:,1);
    im5(:,:,3) = im5(:,:,1);    
    im6 = uint8(zeros(m,n,o));  
elseif nargin == 6
    im2(:,:,1) = im2(:,:,1);
    im2(:,:,2) = im2(:,:,1);
    im2(:,:,3) = im2(:,:,1);    
    im3 = uint8(im3)*255;
    im3(:,:,1) = im3(:,:,1);
    im3(:,:,2) = im3(:,:,1);
    im3(:,:,3) = im3(:,:,1);    
    im4 = uint8(im4)*255;
    im4(:,:,1) = im4(:,:,1);
    im4(:,:,2) = im4(:,:,1);
    im4(:,:,3) = im4(:,:,1);    
    im5 = uint8(im5)*255;
    im5(:,:,1) = im5(:,:,1);
    im5(:,:,2) = im5(:,:,1);
    im5(:,:,3) = im5(:,:,1);    
    im6 = uint8(im6)*255;
    im6(:,:,1) = im6(:,:,1);
    im6(:,:,2) = im6(:,:,1);
    im6(:,:,3) = im6(:,:,1);        
end

figure(19)
imshow([im1 im2 im3;im4 im5 im6])