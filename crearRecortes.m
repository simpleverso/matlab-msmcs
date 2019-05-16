clear all;
close all;
disp("inicio");
for img=751:1142
    OriginalImage = imread(sprintf('/Volumes/Blackpcs/imagenesbpoppeques/frame%d.jpg',img));
    fprintf('imagen %d\n',img);
    %pause(1);
    SplitImage = mat2cell( OriginalImage, 60 * ones(1,size(OriginalImage,1)/60), 80 * ones(1,size(OriginalImage,2)/80), size(OriginalImage,3));
    contador=0;
    for i=1:8
        for j=1:8
            contador = contador+1;
            %imwrite(SplitImage{i,j}, sprintf('/Volumes/Blackpcs/cuadritos/frame%d_%d.jpg',img,contador));
            imwrite(SplitImage{i,j}, sprintf('/Users/gsantiagom/Desktop/751-1142/frame%d_%d.jpg',img,contador));
            %disp(contador);
        end
    end
end
disp("fin");