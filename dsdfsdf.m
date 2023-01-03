gambar = imread('\Uts\learn1.jpg');
deteksi = vision.CascadeObjectDetector;
wajah = deteksi(gambar);
imshow(gambar);