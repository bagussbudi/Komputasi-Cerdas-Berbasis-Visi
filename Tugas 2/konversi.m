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

subplot (2,3,2); imshow(GambarA); title('Citra Asli');
subplot (2,3,4); imshow(imbw); title('Gambar Biner');
subplot (2,3,5); imshow(GambarH); title('Gambar Gray');
subplot (2,3,6); imshow(GambarX); title('Gambar Negative');