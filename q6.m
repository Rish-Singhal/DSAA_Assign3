im = imread('33.jpg');
im = double(im);
it = 21;
Nor = [];
Eff = [];
V = [];
for j = 1:10
   v = it + (j-1)*10;
   V = [ V v];
   [ x_, y_] = funct(im,v);
   Nor =[ Nor x_];
   Eff =[Eff y_];
end

plot(V,Nor,'o-');
hold on;
plot(V,Eff,'o-');
hold off;

function [a,b] = funct(im,k)

[x, y] = size(im);
nx = x - k + 1;
ny = y - k + 1;


fim = zeros(nx,ny);
filt = ones(k,k)/(k*k);
tic
for u = 1:nx
    for v = 1:ny
         nnx = u + k - 1;
         nny = v + k - 1;
         fi = filt.*im(u:nnx,v:nny);
         fim(u,v)=sum(fi(:));
    end
end
a = toc;
% optimizations 


fim2 = zeros(nx,ny);
tic
for u = 1:nx
    for v = 1:ny
         nnx = u + k - 1;
         nny = v + k - 1;
         
         if u==1 && v==1 % first row, first column
                fi = im(u:nnx,v:nny);
                fim2(u,v)=sum(fi(:))/(k*k);  
         elseif v==1 % first column
                fim2(u,v) = fim2(u-1,v)-sum(im(u-1,v:nny))/(k*k)+sum(im(nnx,v:nny))/(k*k);
         else
                fim2(u,v) = fim2(u,v-1)-sum(im(u:nnx,v-1))/(k*k)+sum(im(u:nnx,nny))/(k*k);
                
         end
    end
end
b = toc;
%imshow(fim2,[]);
end