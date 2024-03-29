A = imread('Gambar.png');
rgbImage = imread('Gambar.png');
A = im2double(A);
set(gcf,'Position',get(0,'Screensize'));

r=A(:,:,1);
g=A(:,:,2);
b=A(:,:,3);

c = 1-r;
m = 1-g;
y = 1-b;
CMY = cat(3,c,m,y);

Y = 0.3*r+0.59*g+0.11*b;
I = 0.6*r-0.28*g-0.32*b;
Q = 0.21*r-0.52*g+0.31*b;
YIQ = cat(3,Y,I,Q);

YCBCR = rgb2ycbcr(rgbImage);
HSV=rgb2hsv(rgbImage);

subplot(3,3,2);imshow(A);title('Citra Asli');
subplot(3,3,4);imshow(CMY);title('RGB to CMY');
subplot(3,3,6);imshow(YIQ);title('RGB to YIQ');
subplot(3,3,7);imshow(YCBCR);title('RGB to YCBCR');
subplot(3,3,9);imshow(HSV);title('RGB to HSV');