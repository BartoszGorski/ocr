function [ imageOut ] = contrastStr( image, r1, s1, r2, s2 )
%CONTRASTSTR
% r1 'Enter the value of r1 (64-128);
% s1 'Enter the value of s1 (0-64);
% r2 'Enter the value of r2 (129-192);
% s2 'Enter the value of s2 (192-255);

s=size(image);
% Calculating l
l=s1/r1;
%Calculating m
m=(s2-s1)/(r2-r1);
%Calculating n
n=(255-s2)/(255-r2);

for x=1:s(1)
    for y=1:s(2)
        if image(x,y)>=0 && image(x,y)<r1
            imageOut(x,y)=l*double(image(x,y));
        elseif image(x,y)>=r1 && image(x,y)<r2
            imageOut(x,y)=m*(double(image(x,y))-r1)+s1;
        elseif image(x,y)>=r2 && image(x,y)<=255
            imageOut(x,y)=n*(double(image(x,y))-r2)+s2;
        end
    end
end

 imageOut=uint8(imageOut);

end

