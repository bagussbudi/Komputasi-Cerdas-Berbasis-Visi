A=imread('untag.jpg');
set(gcf,'Position',get(0,'Screensize'));
B=3*A;
C=0.2*A;
D=rgb2gray(A);
E=rgb2gray(B);
F=rgb2gray(C);

subplot(3,2,1);imshow(A);title('Citra Asli');
subplot(3,2,2);imhist(D);title('Histogram Citra Asli');
subplot(3,2,3);imshow(B);title('High Contras');
subplot(3,2,4);imhist(E);title('Histogram High Contras');
subplot(3,2,5);imshow(C);title('Low Contras');
subplot(3,2,6);imhist(F);title('Histogram Low Contras');
