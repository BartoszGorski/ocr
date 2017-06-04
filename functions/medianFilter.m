function outImage = medianFilter( image, sizeFilter, T )

    % FILTR MEDIANOWY
 %
 % obraz - obraz do odfiltrowania (jedna maska obrazu)
 % dlugosc_filtru - rozmiar otoczenia piksela
 % (macierz o wymiarach dlugosc_filtru X dlugosc_filtru)
 % T - wartość o ile musi się różnić piksel od mediany, żeby go odfiltrować

    
    rozmiar_maski = size(image); % rozmiar obrazu do odfiltrowania
 
    % liczba pikseli o które trzeba  będzie powiększyć obraz z każdej strony aby prawidłowo filtrować 
    addPixels = floor(sizeFilter/2);
    
    % tworzy macierz o wymiarach jak obraz  ale z powiększonymi wymiarami X i Y o addPixels
    extendedImg=uint8(ones(rozmiar_maski(1) + 2*addPixels, rozmiar_maski(2) + 2*addPixels, 1));

    %kopiuje ogryginalny obraz do poszerzonego
    extendedImg(addPixels+1:rozmiar_maski(1)+addPixels, addPixels+1:rozmiar_maski(2)+addPixels,:)=image(:,:,:);
    outImage=double(image);
    
    for x= addPixels+1:rozmiar_maski(1)
        for y=addPixels+1:rozmiar_maski(2)
            
            FilterWindow=extendedImg(x-addPixels:x+addPixels,y-addPixels:y+addPixels,1);
            
            mediana = median(FilterWindow(:)); % oblicza mediane z wycinka
            % window(:) zwraca wektor kolumnowy
            % elementów macierzy, elementy są zwracane w kolejności 'po kolumnach'
            
            if abs(outImage(x-addPixels,y-addPixels,1) - double(mediana)) > T % sprawdza czy różnica między medianą a wartością piksela większa niż T, jeśli tak to filtruje piksel
              outImage(x-addPixels,y-addPixels,1) = double(mediana);
            end

        end
    end
    
    %convert output to 0-255 range image
    outImage=uint8(outImage);

end

