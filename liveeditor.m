a=1;
b=2;
c=a+b;
disp(c+b);

tic
url = 'https://www.mathworks.com/content/mathworks/www/en/products/matlab/live-editor/jcr:content/mainParsys/band_1981140664_copy/mainParsys/columns/1/image.adapt.full.high.gif/1550794277043.gif';
foto = imread(websave('prueba.jpg',url));
foto = imbinarize(foto);
%imagenecualizada = histeq(foto);
figure
%imshow(imagenecualizada);
imshow(foto);
toc
