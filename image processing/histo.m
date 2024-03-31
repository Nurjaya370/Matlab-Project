gambar=imread('gambar/ai.jpg'); %--------membaca file gambar
red=gambar(:,:,1); %memanggil matriks gambar yang hanya berisi piksel warna merah
green=gambar(:,:,2);% memanggil matriks gambar yang hanya berisi piksel
blue=gambar(:,:,3); %memanggil matriks gambar yang hanya berisi piksel
merahgray2=0.3*red+0.5*green+0.2*blue;
imshow(gambar);
imshow(red);
imshow(green);
imshow(blue);
imshow(merahgray2);
imhist(red)
imhist(green)
imhist(blue)
%imhist(gray)

