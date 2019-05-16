img = imread('/Users/gsantiagom/Desktop/IMAGENES/fuzzycmeans.png');
img2 = 255-img;
figure
imshow(img2); %invertir

se = strel('disk',5);
BW2 = imdilate(img2,se);
figure
imshow(BW2)
