function salida = darkchannel(imagen)
    salida =rgb2gray(imagen);
%salida = imreducehaze(imagen,0.9, 'method', 'approxdcp');
end