gambar = imread('learn1.jpg');
imshow(gambar);
deteksi = vision.CascadeObjectDetector;
wajah = deteksi(gambar);
imshow(gambar);