function grayImg = changeToGray( img )

    r=img(:,:,1);
    g=img(:,:,2);
    b=img(:,:,3);

    grayImg=r*0.2989 + g*0.5870 + b*0.1140;

end

