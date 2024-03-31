gambar=imread('gambar/ai.jpg'); 
crop=imcrop(gambar,[170 37 130 150]); 
imshow(gambar), figure, imshow(crop); 
