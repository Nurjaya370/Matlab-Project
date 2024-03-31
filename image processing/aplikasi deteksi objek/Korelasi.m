
%% Program untuk mendeteksi objek dalam sebuah citra dengan Template
%% Matching menggunakan algoritma korelasi.
%% Objek yang dideteksi adalah buah strawberi di dalam citra kumpulan buah.
%%
%%          By JANS HENDRY
%%              05965
%%      Teknik Klasifikasi Pola
%%


clear all;
close all;
clc;


%% 1. Inisialisasi citra yang akan diolah

filename = 'FRAME_1.JPG';
tmplt = 'template.jpg';

F = imread(filename); 
[row,col,val]=size(F);

if val>1
    frm=rgb2gray(F);
end
frm = double(frm);

T = imread(tmplt);
[row,col,val]=size(T);

if val>1
    tmplt=rgb2gray(T);
end
tmplt = double(tmplt);
%%

%% 2. Penerapan algoritma KORELASI untuk template matching
frmMean = conv2(frm,ones(size(tmplt))./numel(tmplt),'same');
tmpltMean = mean2(tmplt);
kor1 = conv2(frm,fliplr(flipud(tmplt-tmpltMean)),'same')./numel(tmplt);
kor2 = frmMean.*sum(tmplt(:)-tmpltMean);
stdFrm = sqrt(conv2(frm.^2,ones(size(tmplt))./numel(tmplt),'same')-frmMean.^2);
stdTmplt = std2(tmplt);
skor = (kor1-kor2)./(stdFrm.*stdTmplt);
%%

%% 3. Menemukan daerah yang cocok
[maxVal,maxIdx] = max(skor(:));
[minVal,minIdx] = min(skor(:));
[maxR, maxC] = ind2sub(size(skor),maxIdx);
%%

%% 4. Uji hipotesis tentang nilai ambang klasifikasi
if ~exist('ambang','var')
    ambang = 0.40; %batas untuk koefisien korelasi juara/pemenang
end
if maxVal>=ambang
    boks(1,:) = [max(1,maxR-round(row/2)), max(1,maxC-round(col/2)), row, col];
else
    boks(1,:) = [];
end
%%

%% 5. Menampilkan citra template, frame dan hasil deteksi

figure,
subplot(121),imshow(F),title('Frame Citra');
subplot(122),imshow(T),title('Template Citra');

figure,imagesc(abs(skor)), colorbar, 
title('Ruang Pengukuran Korelasi')

bY = [boks(1),boks(1)+boks(3),boks(1)+boks(3),boks(1),boks(1)];
bX = [boks(2),boks(2),boks(2)+boks(4),boks(2)+boks(4),boks(2)];

figure,imshow(F),line(bX,bY),title('Hasil Deteksi objek');

disp('selesai');

%% done

