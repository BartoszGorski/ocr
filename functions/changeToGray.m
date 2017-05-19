function grayImg = changeToGray( img )

    r=img(:,:,1);
    g=img(:,:,2);
    b=img(:,:,3);

    grayImg=r*0.333 + g*0.333 + b*0.333;

end

