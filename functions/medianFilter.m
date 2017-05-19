function outImage = medianFilter( image, sizeFilter )

    %sizeFilter is square sizeFilter x sizeFilter (e.g. 3x3)

    %add zeros to image edgeds
    addZeros = sizeFilter - 1;
    extendedImg=zeros(size(image)+addZeros);
    outImage=zeros(size(image));

    %copy original img to extended
    
    shift=floor(addZeros/2);
    for x=1:size(image,1)
        for y=1:size(image,2)
            extendedImg(x+shift,y+shift)=image(x,y);
        end
    end
    
    % makeing array('window') that copies values of pixels in range FILTER_SIZE x FILTER_SIZE (e.g. 3x3)

    for i= 1:size(image,1)
        for j=1:size(image,2)
            window=zeros(sizeFilter*sizeFilter,1);
            ind=1;
            for x=1:sizeFilter
                for y=1:sizeFilter
                    window(ind)=extendedImg(i+x-1,j+y-1);
                    ind=ind+1;
                end
            end

            median=sort(window);
            
            %place the median pixel to the output
            middle=round((sizeFilter*sizeFilter)/2);
            outImage(i,j)=median(middle);

        end
    end
    
    %convert output to 0-255 range image
    outImage=uint8(outImage);

end

