A=imread('untag.jpg');
subplot(2,2,1);imshow(A);title('Citra Berwarna(RGB)');
set(gcf,'Position',get(0,'Screensize'));

R=A(:,:,1);%memanggil matriks gambar piksel warna merah
G=A(:,:,2);%memanggil matriks gambar piksel warna hujai
B=A(:,:,3);%memanggil matriks gambar piksel warna biru

subplot(2,2,2);imhist(R);title('Histogram Warna Red');
subplot(2,2,3);imhist(G);title('Histogram Warna Green');
subplot(2,2,4);imhist(B);title('Histogram Warna Blue');