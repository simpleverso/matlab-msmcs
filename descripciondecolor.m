clear all;
close all;
tic
foto = imread('/Users/gsantiagom/Desktop/color.png');

figure(1)
imshow(foto)
pixels=impixel(foto);
minR=min(pixels(:,1)); minG=min(pixels(:,2)); minB=min(pixels(:,3));
maxR=max(pixels(:,1)); maxG=max(pixels(:,2)); maxB=max(pixels(:,3));
    for x=1:size(foto,1)
        for y=1:size(foto,2)
            if foto(x,y,1)>= minR && foto(x,y,1)<=maxR && ...
            foto(x,y,2)>= minG && foto(x,y,2)<=maxG && ...
            foto(x,y,3)>= minB && foto(x,y,3)<=maxB
        
            foto(x,y,1)=255;
            foto(x,y,2)=255; 
            foto(x,y,3)=255;
            else
            foto(x,y,1)=0;
            foto(x,y,2)=0;
            foto(x,y,3)=0;

            end
        end
    end
figure(2);
imshow(foto)
disp(toc)