GambarAsli = imread('noise.png');
Ukuran = size(GambarAsli);
tinggi = Ukuran(1);
lebar = Ukuran(2);

% Untuk memaksimalkan ukuran gambar sesuai layar

set(gcf,'Position',get(0,'Screensize'));

% Filter Batas

FBatas = GambarAsli;

for baris=2 : tinggi-1
    for kolom=2 : lebar-1
        minPiksel = min([GambarAsli(baris-1, kolom-1)                     ...
            GambarAsli(baris-1, kolom) GambarAsli(baris, kolom+1)         ...
            GambarAsli(baris, kolom-1)                                    ...
            GambarAsli(baris, kolom+1) GambarAsli(baris+1, kolom-1)       ...
            GambarAsli(baris+1, kolom) GambarAsli(baris+1, kolom+1)]);
    
        maksPiksel = min([GambarAsli(baris-1, kolom-1)                    ...
            GambarAsli(baris-1, kolom) GambarAsli(baris, kolom+1)         ...
            GambarAsli(baris, kolom-1)                                    ...
            GambarAsli(baris, kolom+1) GambarAsli(baris+1, kolom-1)       ...
            GambarAsli(baris+1, kolom) GambarAsli(baris+1, kolom+1)]); 
        
        if GambarAsli(baris, kolom) < minPiksel
            FBatas(baris, kolom) = minPiksel;
        else
            if GambarAsli(baris, kolom) > maksPiksel
                FBatas(baris, kolom) = maksPiksel;
            else
                FBatas(baris, kolom) = GambarAsli(baris, kolom);
            end
        end
    end
end

% Filter Pererataan

Filter = double(GambarAsli);

for baris1=2 : tinggi-1
    for kolom1=2 : lebar-1
        jumlah = Filter(baris1-1, kolom1-1)+    ...
            Filter(baris1-1, kolom1) +          ...
            Filter(baris1-1, kolom1-1) +        ...
            Filter(baris1, kolom1-1) +          ...
            Filter(baris1, kolom1) +            ...
            Filter(baris1, kolom1+1) +          ...
            Filter(baris1+1, kolom1-1) +        ...
            Filter(baris1+1, kolom1) +          ...
            Filter(baris1+1, kolom1+1);
        
        % Ambil nilai rerata
        FRerata(baris1, kolom1) = uint8(1/9 * jumlah);
    end
end

% Filter Median

for baris2=2 : tinggi-1
    for kolom2=2 : lebar-1
        data = [GambarAsli(baris2-1, kolom2-1) ...
            GambarAsli(baris2-1, kolom2)       ...
            GambarAsli(baris2-1, kolom2+1)     ...
            GambarAsli(baris2, kolom2-1)       ...
            GambarAsli(baris2, kolom2)         ...
            GambarAsli(baris2, kolom2+1)       ...
            GambarAsli(baris2+1, kolom2-1)     ...
            GambarAsli(baris2+1, kolom2)       ...
            GambarAsli(baris2+1, kolom2+1)];
         
        % Urutkan for 
        for i = 1 : 8
            for j = i+1 : 9
                if data(i) > data(j)
                    tmp = data(i);
                    data(i) = data(j);
                    data(j) = tmp;
                end
            end
        end
        
        % Ambil nilai median
        FMedian(baris2, kolom2) = data(5);
    end
end


subplot (2,3,2); imshow(GambarAsli); title('Citra Asli');
subplot (2,3,4); imshow(FBatas); title('Citra Filter Batas');
subplot (2,3,5); imshow(FRerata); title('Citra Filter Pererataan');
subplot (2,3,6); imshow(FMedian); title('Citra Filter Median');

clear;