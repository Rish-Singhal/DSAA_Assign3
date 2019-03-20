clc;clear;
a = csvread('Altitude.csv',1,0,[1,0,900,1]);
a = [a ones(900,1)];
y = csvread('Altitude.csv',1,2,[1,2,900,2]);

at = csvread('Altitude.csv',901,0,[901,0,1000,1]);
yt = csvread('Altitude.csv',901,2,[901,2,1000,2]);
at = [at ones(100,1)];

m = 900;
coef = [ 0 0 0 ]';
alpha = 0.0002364;

for i = 1:200000
    h_th = a*coef;
    coef = coef - alpha*(1/m)*sum((h_th - y).*a).';
    err = 1/(m)*sum((h_th-y).*a).';
   % display(err);

end

newv = at*coef;
val = mean(abs(newv-yt).^2)^(1/2);
display(val);



