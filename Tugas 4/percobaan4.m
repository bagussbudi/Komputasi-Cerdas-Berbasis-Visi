GambarAsli=imread('noise.jpg');
% Mengubah citra ke tipe gray image
j=rgb2gray(GambarAsli);
%menambahkan salt & pepper noise sebesar 10%
j_sp=imnoise(j,'salt & pepper',0.1);
%membuat dan menambahkan filter rata-rata pada citra
fa=fspecial('average');
jfa=filter2(fa,j_sp);
%filter median
jme=medfilt2(j_sp);
%The outlier method
d=0.2;
f=[0.125 0.125 0.125; 0.125 0 0.125; 0.125 0.125 0.125];
imd=im2double(j_sp);
imf=filter2(f,imd);
r=abs(imd-imf)-d>0;
res=im2uint8(r.*imf+(1-r).*imd);
%Pseudo Median Filter
max=ordfilt2(j_sp,9,ones(3,3));
min=ordfilt2(j_sp,1,ones(3,3));
psmed=1/2*(ordfilt2(min,9,ones(3,3)))
+1/2*(ordfilt2(max,1,ones(3,3)));
%menampilkan Hasil
subplot(2,3,1)
imshow(GambarAsli)
title('asli')
subplot(2,3,2)
imshow(j_sp)
title ('salt & pepper 10%')
subplot(2,3,3)
imshow(jfa/255)
title ('average filter')
subplot(2,3,4)
imshow(jme)
title('median filter')
subplot(2,3,5)
imshow(res)
title('The Outlier Method')
subplot(2,3,6)
imshow(psmed)
title('Pseudo Median')

clear;