A=imread('haha.jpg');
set(gcf,'Position',get(0,'Screensize'));
gray=rgb2gray(A);
thresh=graythresh(gray);
B=im2bw(gray,thresh);
C=A+100;
D=0.3*A;
E=rgb2gray(A);
G=rgb2gray(C);

subplot(3,3,2);imshow(A);title('Citra Asli');
subplot(3,3,4);imshow(B);title('BINNER');
subplot(3,3,5);imshow(C);title('+100 Brightness');
subplot(3,3,6);imshow(D);title('LOW CONTRAST');
subplot(3,3,7);imhist(E);title('Histogram BINNER');
subplot(3,3,8);imhist(gray);title('Histogram Brightness');
subplot(3,3,9);imhist(G);title('Histogram Low Contras');
