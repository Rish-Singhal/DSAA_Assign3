clc;clear;
a = csvread('houses.csv',0,0,[0,0,41,1]);
za = a;
a = [a ones(42,1)];
z = csvread('houses.csv',0,2,[0,2,41,2]);

coef = inv(transpose(a)*a)*transpose(a)*z;
testa = csvread('houses.csv',42,0,[42,0,46,1]);
pp = testa;
testa = [testa ones(5,1)];
zprime = testa*coef;
zchk = csvread('houses.csv',42,2,[42,2,46,2]);

B = [ 15069.47 4 1 ];
ans1 = B*coef;

l2norm = norm(zprime - zchk);




%part2
normalx = normalize(za,1);
normalx = [normalx ones(42,1)];
normaly = normalize(z,1);
coefn = inv(transpose(normalx)*normalx)*transpose(normalx)*normaly;

normtesta = normalize(pp);
normtesta = [normtesta ones(5,1)];
normzchk = normalize(zchk);
zn = normtesta*coefn;

l2normpp = norm(zn - normzchk);


%part 3
means = mean(a,1);
newv = means*coef;
meanv = mean(z,1);
% newv and meanv are same :) within an error e-10 , so it passes

