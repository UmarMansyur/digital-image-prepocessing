picture = imread('learn1.jpg');
viola = vision.CascadeObjectDetector();
detection = step(viola, picture);
border = insertObjectAnnotation(picture, 'rectangle', detection, 'face');
getRed = picture(:,:,1);
getGreen = picture(:,:,2);
getBlue = picture(:,:,3);
count = size(detection,1);
figure;
imshow(border);
figure;
for index = 1:size(detection)
redFace = getRed(detection(index, 2):detection(index, 2)+detection(index, 4) , detection(index, 1):detection(index, 1)+detection(index, 3));
greenFace = getGreen(detection(index, 2):detection(index, 2)+detection(index, 4) , detection(index, 1):detection(index, 1)+detection(index, 3));
blueFace = getBlue(detection(index, 2):detection(index, 2)+detection(index, 4) , detection(index, 1):detection(index, 1)+detection(index, 3));
subplot(2, count/2, index);
d = imshow(cat(3, redFace, greenFace, blueFace));title('aku');
title(['wajah' ,num2str(index)]);
end
saveas(a, sprintf('test%d.jpg', index));
disp(count);
