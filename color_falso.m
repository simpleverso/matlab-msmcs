clc; %borrar pantalla%
clear all; %borrar todo%
% x = imread('E:\CLASE DE VISION\1.jpg');
%tic
x = imread('/Users/gsantiagom/Desktop/color.png');
%x = histeq(x); %regresar
% x = rgb2gray(x);
% B = [1, 0, 1; 0, -5, 0; 0, 1, 0];
% x = conv2(x,B);
figure %regresar
imshow(x);%regresar
%conversion a pseudocolor
xpseu = zeros(size(x));
%obtenemos el tamaño de la imagen
tam = size(x);

%x = rgb2gray(x);



for i = 1 : tam(1)
    for j = 1 : tam(2)
        if (x(i,j,1) <= 0 && x(i,j,1) < 95)
            xpseu(i,j,1) = double(0);
        elseif (x(i,j,1) < 95 && x(i,j,1) < 159)
            xpseu(i,j,1) = double((x(i,j,1)*4)-34);
        elseif (x(i,j,1) <= 159 && x(i,j,1) <= 223)
            xpseu(i,j,1) = double(255);
        elseif (x(i,j,1) < 223 && x(i,j,1) <= 255)
            xpseu(i,j,1) = double((x(i,j,1)*-4)+892);
        end
    end
end

for i = 1 : tam(1)
    for j = 1 : tam(2)
        if (x(i,j,2) <= 0 && x(i,j,2) < 31)
            xpseu(i,j,2) = double(0);
        elseif (x(i,j,2) < 31 && x(i,j,2) < 95)
            xpseu(i,j,2) = double((x(i,j,2)*4)-124);
        elseif (x(i,j,2) <= 95 && x(i,j,2) <= 159)
            xpseu(i,j,2) = double(255);
        elseif (x(i,j,2) < 159 && x(i,j,2) <= 223)
            xpseu(i,j,2) = double((x(i,j,2)*-4)+636);
        elseif (x(i,j,2) <= 223 && x(i,j,2) <= 255)
            xpseu(i,j,2) = double(0);
        end
    end
end

for i = 1 : tam(1)
    for j = 1 : tam(2)
        if (x(i,j,3) <= 0 && x(i,j,3) < 31)
            xpseu(i,j,3)  = double((x(i,j,3) *4)-131);
        elseif (x(i,j,3)  <= 31 && x(i,j,3) <= 95)
            xpseu(i,j,3)  = double(255);
        elseif (x(i,j,3)  < 95 && x(i,j,3) < 159)
            xpseu(i,j,3) = double((x(i,j,3) *-4)+380);
        elseif (x(i,j,3)  <= 159 && x(i,j,3) <= 255)
            xpseu(i,j,3) = double(0);
        end
    end
end

% figure %regresar
% imshow(x); %regresar
% 
 figure %regresar
 imshow(xpseu); %regresar

BW2 = im2bw(xpseu);

figure %regresar
imshow(BW2); %regresar

xpseu2(:,:,1) = (uint8(xpseu(:,:,2)) + uint8(xpseu(:,:,3))) - (uint8(xpseu(:,:,2)) - uint8(xpseu(:,:,3))) ;
xpseu2(:,:,2) = uint8(xpseu(:,:,3)) - uint8(xpseu(:,:,1));
xpseu2(:,:,3) = uint8(xpseu(:,:,3)) + uint8(xpseu(:,:,2));

% xpseu2(:,:,1) = uint8(xpseu(:,:,2)) + uint8(xpseu(:,:,3));
% xpseu2(:,:,2) = uint8(xpseu(:,:,3)) - uint8(xpseu(:,:,1));
% xpseu2(:,:,3) = uint8(xpseu(:,:,3)) - uint8(xpseu(:,:,2));

 figure %regresar
 imshow(xpseu2); %regresar

%disp(toc)
salida = rgb2gray(xpseu2);
BW = imbinarize(salida);
figure
imshow(BW);

% //invertir imagen
% y(:,:,:)=255-BW(:,:,:);
% figure
% imshow(y);

% BW=repmat(double(BW),[1,1,3]); %convertir de binario a color
% 
% figure
% imshow(BW);


