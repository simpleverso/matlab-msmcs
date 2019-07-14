I = imread('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Synthese%2B.svg/220px-Synthese%2B.svg.png');
figure
imshow(I);
In = zeros(size(I));
In(:,:,1) = I(:,:,1);
figure
imshow(In);
In = zeros(size(I));
In(:,:,2) = I(:,:,2);
figure
imshow(In);
In = zeros(size(I));
In(:,:,3) = I(:,:,3);
figure
imshow(In);
