clear;
clear all;
disp("inicio");
ReadObj = VideoReader('/Volumes/Blackpcs/bepop2.mp4'); 
CurFrame = 685;
while hasFrame(ReadObj)
    CurImage = readFrame(ReadObj);
    
    for i=1:23 %cada 24 frames, 23 de este mas 1 del while anterior
        if(hasFrame(ReadObj))
            %CurImage = readFrame(ReadObj); %ponerlo en memoria
            readFrame(ReadObj); %no ponerlo en memoria
        end
    end
    
    CurFrame = CurFrame+1;
    RGB2 = imresize(CurImage, [480 640]);
    imwrite(RGB2, sprintf('/Volumes/Blackpcs/imagenesbpoppeques/frame%d.jpg', CurFrame));
    disp(CurFrame);
    clear CurImage;
    clear ans;
end
disp("Terminado");