F = imread(frame); 
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


%% 2. Penerapan algoritma KORELASI untuk template matching
    frmMean = conv2(frm,ones(size(tmplt))./numel(tmplt),'same');
    tmpltMean = mean2(tmplt);
    kor1 = conv2(frm,rot90(tmplt-tmpltMean,2),'same')./numel(tmplt);
    kor2 = frmMean.*sum(tmplt(:)-tmpltMean);
    stdFrm = sqrt(conv2(frm.^2,ones(size(tmplt))./numel(tmplt),'same')-frmMean.^2);
    stdTmplt = std2(tmplt);
    skor = (kor1-kor2)./(stdFrm.*stdTmplt);
    pause(0.03)



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
figure,imagesc(abs(skor)), colorbar, 
title('Ruang Pengukuran Korelasi')

bY = [boks(1),boks(1)+boks(3),boks(1)+boks(3),boks(1),boks(1)];
bX = [boks(2),boks(2),boks(2)+boks(4),boks(2)+boks(4),boks(2)];


figure;
subplot(1, 3, 1); imshow(F); title('Frame Citra');
subplot(1, 3, 2); imshow(T); title('Template Objek');
subplot(1, 3, 3); imshow(F);line(bX,bY); title('Hasil Deteksi Objek');
msgbox('objek berhasil di deteksi')

