function outputImage = bilateralFilter(inputImage, sigmaSpatial, sigmaIntensity)
    inputImage = double(inputImage);
    [m, n] = size(inputImage);
    outputImage = zeros(m, n);

    for i = 1:m
        for j = 1:n
            pixelValue = inputImage(i, j);

            % Hitung batas window
            iMin = max(1, i - sigmaSpatial);
            iMax = min(m, i + sigmaSpatial);
            jMin = max(1, j - sigmaSpatial);
            jMax = min(n, j + sigmaSpatial);

            % Ambil window spasial
            spatialWindow = inputImage(iMin:iMax, jMin:jMax);

            % Hitung bobot spasial
            spatialWeights = exp(-((i - iMin).^2 + (j - jMin).^2) / (2 * sigmaSpatial^2));

            % Hitung bobot intensitas
            intensityWeights = exp(-(spatialWindow - pixelValue).^2 / (2 * sigmaIntensity^2));

            % Normalisasi bobot spasial dan intensitas
            normalizedWeights = spatialWeights .* intensityWeights;
            normalizedWeights = normalizedWeights / sum(normalizedWeights(:));

            % Menghitung nilai piksel hasil
            outputImage(i, j) = sum(spatialWindow(:) .* normalizedWeights(:));
        end
    end
end
