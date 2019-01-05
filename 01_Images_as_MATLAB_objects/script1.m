%basic image proc lab1
IM = imread('./input/AlfredoBorba_TuscanLandscape.jpg');

imshow(IM);

numclr = size(IM, 3); 
isColor = numclr == 3; %3. dimenzio menten pont 3 a merete (rgb)

GR_IM = rgb2gray(image);
numgr = size(GR_IM, 3); %3. dimenzio nincs tehat 1-re tér vissza

imshow(GR_IM);
imwrite(GR_IM, './output/grayim1.jpg')