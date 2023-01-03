picture = imread('saya.jpg');
getRed = picture(end:-1:1,:,1);
getGreen = picture(end:-1:1,:,2);
getBlue = picture(end:-1:1,:,3);
getRGB = cat(3,getRed, getGreen, getBlue);
figure, imshow(getRGB);title('Rotate 180');

picture = imread('saya.jpg');
getRed = picture(:,end:-1:1,1);
getGreen = picture(:,end:-1:1,2);
getBlue = picture(:,end:-1:1,3);
getRGB = cat(3,getRed, getGreen, getBlue);
figure, imshow(getRGB);title('Rotate 270');
