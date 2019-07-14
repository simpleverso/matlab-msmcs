I = imread('https://www.carnovsky.com/imgs/carnovsky_RGB_1.jpg');
figure
imshow(I);
I1=I;
In = zeros(size(I(:,:,1)));
I1(:,:,2) = In;
I1(:,:,3) = In;
figure
imshow(I1);

I2=I;
In = zeros(size(I(:,:,1)));
I2(:,:,1) = In;
I2(:,:,3) = In;
figure
imshow(I2);

I3=I;
In = zeros(size(I(:,:,1)));
I3(:,:,1) = In;
I3(:,:,2) = In;
figure
imshow(I3);
