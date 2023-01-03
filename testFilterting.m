clc;
clear;

I = imread('khana.jpeg');
I = imnoise(I,'gaussian');
figure, imshow(I)
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
MR = medfilt2(R);
MG = medfilt2(G);
MB = medfilt2(B);
I = cat(3, MR, MG, MB);
figure, imshow(I)