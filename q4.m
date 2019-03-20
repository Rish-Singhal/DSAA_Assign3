clc;clear;
load('Q4.mat');
f = fft(X);
%stem(fftshift(f));
nf = abs(f);
[~,max1] = max(nf);
nf(max1) = [];
[~,max2] = max(nf);
nf(max2) = [];
[val2,max2] = max(nf);

f(abs(f) < val2) = 0 ;
nX = ifft(f);
sound(nX,Fs);
