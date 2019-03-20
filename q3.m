clear;clc;
f = imread('33.jpg');
p2 = zeros(128);
p2(1:64,1:64)= f;
p3 = zeros(256);
p3(1:128,1:128)= p2;
p4 = zeros(512);
p4(1:256,1:256)= p3;


subplot(2,2,1);
plotf(f);
subplot(2,2,2);
plotf(p2);
subplot(2,2,3);
plotf(p3);
subplot(2,2,4);
plotf(p4);

figure(2);
subplot(2,2,1);
plotf2(f);
subplot(2,2,2);
plotf2(p2);
subplot(2,2,3);
plotf2(p3);
subplot(2,2,4);
plotf2(p4);

function F = plotf(X)
    F = fft2(X);    
    F = fftshift(F);
    F = abs(F); 
    F = log(F+1);
    F = mat2gray(F); 
    imshow(F,[]); 
end

function F = plotf2(X)
    F = fft2(X);    
    F = fftshift(F);
    F = abs(F); 
    stem(F); 
end