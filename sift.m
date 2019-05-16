valores = 30;
% img = imread('/Users/gsantiagom/Desktop/IMAGENES/1.jpg');
% img2 = imread('/Users/gsantiagom/Desktop/IMAGENES/10.jpg');
%vaca
img = imread('/Users/gsantiagom/Desktop/IMAGENES/prueba_2_km_es.png');
img2 = imread('/Users/gsantiagom/Desktop/IMAGENES/prueba_2_km_re.png');
I = single(rgb2gray(img));
I2 = single(rgb2gray(img2));
figure
imshow(img);
[f,d] = vl_sift(I);
[f2,d2] = vl_sift(I2);
perm = randperm(size(f,2));
perm2 = randperm(size(f2,2));

sel = perm(1:valores);
h1 = vl_plotframe(f(:,sel));
h2 = vl_plotframe(f(:,sel));
set(h1,'color','k','linewidth',3);
set(h2,'color','y','linewidth',2);
% h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel));
% set(h3,'color','g') ;

figure
imshow(img2);
sel = perm2(1:valores);
h1 = vl_plotframe(f2(:,sel));
h2 = vl_plotframe(f2(:,sel));
set(h1,'color','m','linewidth',3);
set(h2,'color','r','linewidth',2);
% h3 = vl_plotsiftdescriptor(d2(:,sel),f2(:,sel));
% set(h3,'color','b');

[fa, da] = vl_sift(I);
[fb, db] = vl_sift(I2);
[matches, scores] = vl_ubcmatch(da, db);




