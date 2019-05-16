clear all
close all
tic
img = imread('/Users/gsantiagom/Desktop/IMAGENES/Prueba_1.png');
img = im2double(img);
R = img(:, :, 1);
G = img(:, :, 2);
B = img(:, :, 3);

X = [R(:) G(:) B(:)];
Z = X;
nColor = 3;
Method = 'Fuzzy Clustering (FCM)';
[C, U] = fcm(Z, nColor);

[maxU, IDX] = max(U);

Z2 = C(IDX, :);
X2 = Z2;

R2 = reshape(X2(:,1), size(R));
G2 = reshape(X2(:,2), size(G));
B2 = reshape(X2(:,3), size(B));

img2 = zeros(size(img));
img2(:,:,1) = R2;
img2(:,:,2) = G2;
img2(:,:,3) = B2;

figure
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(img2); title(['Color Reduced Image (k = ' num2str(nColor) ') using ' Method]);

img3 = im2bw(img2);

figure
imshow(img3);
disp(toc);