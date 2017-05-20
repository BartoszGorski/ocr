function image_out = adapthisteq_own( image_in )
[M,N]=size(image_in);
histgray=jmhist(image_in);
py=histgray/(M*N);
Py=cumsum(py);
Hy=256*Py;
for m= 1:M
    for n= 1:N
        image_in(m,n)=uint8(Hy(image_in(m,n)+1));
    end
end

image_out=image_in;

end

