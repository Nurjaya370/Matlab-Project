% Membuat objek 3D
[x, y] = meshgrid(1:5, 1:5);
z = [5 2 3 6 1; 7 6 9 8 4; 9 8 7 5 3; 6 5 6 7 2; 4 3 3 4 5];

% Menampilkan objek 3D
figure;
surf(x, y, z);
title('Objek 3D sebelum Transformasi Perspektif');

% Menentukan transformasi perspektif
originalPoints = [1, 1; 5, 1; 5, 5; 1, 5];
desiredPoints = [2, 2; 4, 2; 5, 4; 1, 4];
tform = fitgeotrans(originalPoints, desiredPoints, 'projective');

% Menerapkan transformasi perspektif pada objek 3D
[xTransformed, yTransformed] = transformPointsForward(tform, x(:), y(:));
zTransformed = z(:);  % Tidak ada perubahan pada sumbu z

% Menampilkan hasil transformasi perspektif
figure;
scatter3(xTransformed, yTransformed, zTransformed, 'filled');
title('Objek 3D setelah Transformasi Perspektif');
