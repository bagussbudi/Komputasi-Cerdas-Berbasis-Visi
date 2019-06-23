GambarA = imread('haha.jpg');
GambarB = im2bw(GambarA,0);
GambarC = im2bw(GambarA,0.2);
GambarD = im2bw(GambarA,0.4);
GambarE = im2bw(GambarA,0.7);
GambarF = im2bw(GambarA,0.9);
GambarG = im2bw(GambarA,1);
GambarH = rgb2gray(GambarA);
GambarX = 255 -GambarA;

gray=rgb2gray(GambarA);
thresh=graythresh(gray);
imbw=im2bw(gray,thresh);

subplot (3,3,2); imshow(GambarA); title('Citra Asli');
subplot (3,3,4); imshow(GambarB); title('Nilai Threshold 0');
subplot (3,3,5); imshow(GambarC); title('Nilai Threshold 0.2');
subplot (3,3,6); imshow(GambarD); title('Nilai Threshold 0.4');
subplot (3,3,7); imshow(GambarE); title('Nilai Threshold 0.7');
subplot (3,3,8); imshow(GambarF); title('Nilai Threshold 0.9');
subplot (3,3,9); imshow(GambarG); title('Nilai Threshold 1');