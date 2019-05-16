close all;
clc;
%centro nacional de inteligencia
I = imread('/Users/gsantiagom/Desktop/1-250/frame150_64.jpg');
I = histeq(I);
calcularTexturas(I);
% I = imread('/Users/gsantiagom/Desktop/IMAGENES/prueba_2.png');
% calcularTexturas(I);