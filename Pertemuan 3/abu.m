gambar = imread('luffy.jpg');
imshow(abu2(gambar, 3));
hasil = abu2(gambar, 3);
gas(hasil, 125);
function hasil = abu2(gambar, metode)
    getRed = gambar(:,:,1);
    getGreen = gambar(:,:,2);
    getBlue = gambar(:,:,3);
    switch metode
        case 1  
            hasil = max(max(getRed, getGreen), getBlue) + min(min(getRed, getGreen), getBlue)*0.5;
        case 2  
            hasil = (getRed+getGreen+getBlue)/3;
        case 3
            hasil = (0.3*getRed) + (0.59*getGreen) + (0.11*getBlue);
    end          
end

function coba = gas(gambar, threshold)
    [baris, kolom] = size(gambar);
    for a = 1:baris
        for b = 1:kolom
            if(gambar(a,b)<= threshold)
                image(a,b)= 0;
            else
                image(a,b)= 1;
            end
        end
    end
    imshow(image);
end