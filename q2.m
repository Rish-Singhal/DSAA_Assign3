clear;clc;
f = rgb2gray(imread('1.png'));
h = imread('2.jpg');
F = fft2(f);
H = fft2(h);
Z = abs(ifft2(F.*H));
con = conv2(f,h);
concent = con(255-127:255+128,255-127:255+128);
diff = abs(concent-Z).^2;
avg = mean2(diff);

paddedf = zeros(511);
paddedf(1:256,1:256) = f;      
paddedh = zeros(511);
paddedh(1:256,1:256) = h;

Fx = fft2(paddedf);
Hx = fft2(paddedh);
Zx = abs(ifft2(Fx.*Hx));
conx = conv2(f,h);
diffx = abs(conx-Zx).^2;
avgx = mean2(diffx);
%newsub = fcon(row1:row2, column1:column2);

