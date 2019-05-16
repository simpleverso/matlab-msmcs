close all
clear all

x = imread('/Users/gsantiagom/Desktop/color.png');

%conversion a pseudocolor JET255
xpseu = zeros(size(x));
tam = size(x);

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


Rjet=uint8(xpseu(:,:,1));
Gjet=uint8(xpseu(:,:,2));
Bjet=uint8(xpseu(:,:,3));

%Aquí comienzan las pruebas con los nuevos espacios de color

% xpseu2(:,:,1) = Rjet - Gjet;
% xpseu2(:,:,2) = Gjet;
% xpseu2(:,:,3) = Bjet;

% xpseu2(:,:,1) = Gjet - Rjet;
% xpseu2(:,:,2) = Gjet;
% xpseu2(:,:,3) = Bjet;

% xpseu2(:,:,1) = Rjet + Gjet;
% xpseu2(:,:,2) = Gjet;
% xpseu2(:,:,3) = Bjet;

% xpseu2(:,:,1) = Rjet;
% xpseu2(:,:,2) = Gjet - Bjet;
% xpseu2(:,:,3) = Bjet;

% xpseu2(:,:,1) = Rjet;
% xpseu2(:,:,2) = Gjet + Bjet;
% xpseu2(:,:,3) = Bjet;

% xpseu2(:,:,1) = Rjet;
% xpseu2(:,:,2) = Gjet - Bjet;
% xpseu2(:,:,3) = Bjet;


% xpseu2(:,:,1) = Rjet + Bjet;
% xpseu2(:,:,2) = Gjet - Bjet;
% xpseu2(:,:,3) = Bjet;

% xpseu2(:,:,1) = Rjet + Bjet;
% xpseu2(:,:,2) = Gjet + Bjet;
% xpseu2(:,:,3) = Bjet;

% xpseu2(:,:,1) = Rjet - Bjet;
% xpseu2(:,:,2) = Gjet - Bjet;
% xpseu2(:,:,3) = Bjet;

% xpseu2(:,:,1) = Rjet - Bjet;
% xpseu2(:,:,2) = Gjet + Bjet;
% xpseu2(:,:,3) = Bjet;


%_______________________

% xpseu2(:,:,1) = Gjet - Rjet;
% xpseu2(:,:,2) = Gjet - (Rjet+Bjet);
% xpseu2(:,:,3) = Bjet;

%opción elegida

% xpseu2(:,:,1) = (Gjet + Bjet)-(Gjet-Bjet);
% xpseu2(:,:,2) = Bjet - Rjet;
% xpseu2(:,:,3) = Bjet + Gjet;

%opción elegida versión completa...
% xpseu2(:,:,1) = (uint8(xpseu(:,:,2)) + uint8(xpseu(:,:,3))) - (uint8(xpseu(:,:,2)) - uint8(xpseu(:,:,3))) ;
% xpseu2(:,:,2) = uint8(xpseu(:,:,3)) - uint8(xpseu(:,:,1));
% xpseu2(:,:,3) = uint8(xpseu(:,:,3)) + uint8(xpseu(:,:,2));


figure
subplot(4,1,1)
imshow(xpseu2);
title('Color Falso de Prueba')
subplot(4,1,2)
histogram(xpseu2(:,:,1));
title('Histograma Rojo')
subplot(4,1,3)
histogram(xpseu2(:,:,2));
title('Histograma Verde')  
subplot(4,1,4)
histogram(xpseu2(:,:,3));
title('Histograma Azul')  