gambar=imread('learn1.jpg');
imshow(gambar);
deteksi=vision.CascadeObjectDetector();
wajah=step(deteksi,gambar);
baru= insertObjectAnnotation(gambar,'rectangle',wajah,'fase');
figure;
imshow(baru);
red= gambar(:,:,1);
blue=gambar(:,:,2);
green=gambar(:,:,3);
jumlah= size(wajah,1);
figure;
for a=1:jumlah
    wajahr=red(wajah(a,2):wajah(a,2)+wajah(a,4),wajah(a,1):wajah(a,1)+wajah(a,3));
    wajahg=green(wajah(a,2):wajah(a,2)+wajah(a,4),wajah(a,1):wajah(a,1)+wajah(a,3));
    wajahb=blue(wajah(a,2):wajah(a,2)+wajah(a,4),wajah(a,1):wajah(a,1)+wajah(a,3));
    warna= cat(3,wajahr,wajahg,wajahb);
    subplot (2,jumlah/2,a);
    imshow(warna);
    title(['wajah' ,num2str(a)]); 
end