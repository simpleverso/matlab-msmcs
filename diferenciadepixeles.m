img1 = imread('/Users/gsantiagom/Desktop/IMAGENES/prueba_1_cf_es.png');
img2 = imread('/Users/gsantiagom/Desktop/IMAGENES/prueba_1_cf_re.png');
img1 = imbinarize(img1);
img2 = imbinarize(img2);
img_res = xor(img1,img2);
res = sum(sum(sum(img_res(:,:,:))));
totalpixeles = size(img1,1) * size(img1,2) * 3;
porcentaje = 100 * res / totalpixeles;
disp('El porcentaje de diferencia es:');
disp(porcentaje);
disp('El porcentaje de parecido ser�a:');
disp(100-porcentaje);