   tic
    nombre = '/Users/gsantiagom/Desktop/IMAGENES/Prueba_1.png';
    no='13-';
    nColors = 5;
    he = imread(nombre);
    imshow(he), title('Original');
    cform = makecform('srgb2lab');
    lab_he = applycform(he,cform);
    ab = double(lab_he(:,:,2:3));
    nrows = size(ab,1);
    ncols = size(ab,2);
    ab = reshape(ab,nrows*ncols,2);
    
    [cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean','Replicates',3); %3 times to avoid local minima
    pixel_labels = reshape(cluster_idx,nrows,ncols);
    imshow(pixel_labels,[]), title('image labeled by cluster index');
    segmented_images = cell(1,3);
    rgb_label = repmat(pixel_labels,[1 1 3]);
    for k = 1:nColors
        color = he;
        color(rgb_label ~= k) = 0;
        segmented_images{k} = color;
    end
     for k = 1:nColors
         figure
         imshow(segmented_images{k}), title(['objects in cluster ',num2str(k),' .']);
     end
    for k = 1:nColors
        %imwrite(segmented_images{k}, ['C:\Users\Gonzalo\Desktop\Continuacion Vision\seg\res',nombre,num2str(k),'.jpg']);
        %imwrite(segmented_images{k}, ['D:\UNIVERSIDAD\Continuacion Vision\seg\res',no,num2str(k),'.jpg']);
    end

    disp(toc)
    
%%texturas...
% clear all;
% x = imread('C:\Users\Posgrado\Desktop\textura3.png');
% xgris = rgb2gray(x);
% histo = imhist(xgris);
% 
% media = 0.0;
% for i=1 : size(histo,1)
%     if(histo(i) > 0)
%        media = media + (double(histo(i) / 256));
%     end
% end

% u = 0.0;
% for i=1 : size(histo,1)
%     if(histo(i) > 0)
%         p = double(histo(i) / 256);
%         u = 1 / u + (histo(i)-p);
%     end
% end
% 
% r = 1 - 1 / (1 + u^2);
%  
    