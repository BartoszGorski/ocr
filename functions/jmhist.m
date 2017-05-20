function [ h ] = jmhist( x )
%JMHIST Summary of this function goes here
%   Detailed explanation goes here
[M,N]=size(x);
h=ones(1,255);
for m=1:M
    for n=1:N
        h(x(m,n)+1)=h(x(m,n)+1)+1;
    end
end

end

