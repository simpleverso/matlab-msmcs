img = imread('/Users/gsantiagom/Desktop/his1.png');
%img = rgb2gray(img);
figure
imshow(img(:,:,2));
figure
imhist(img(:,:,2));