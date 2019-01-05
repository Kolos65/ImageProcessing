
IM = imread('./input/AlfredoBorba_TuscanLandscape.jpg');
[V, H, R] = flip_and_rotate(IM);
figure;
subplot(1,3,1);
imshow(V);
subplot(1,3,2);
imshow(H);
subplot(1,3,3);
imshow(R);