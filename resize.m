function [newImage, originalImage] = resize(img, horizontal, vertical)
%RESIZE Summary of this function goes here
%   Detailed explanation goes here
    originalImage = img;
    newImage = img;
    for i=1:horizontal
        gray = rgb2gray(newImage);
        [Gmag, Gdir] = imgradient(gray, 'prewitt');
        seamEnergies = SeamCarves(Gmag);
        seamCoords = findLowestSeam(seamEnergies);
        originalImage = displaySeams(originalImage, seamCoords, false);
        newImage = removeSeam(newImage, seamCoords);
    end
    
    originalImage = permute(originalImage, [2 1 3]);
    newImage = permute(newImage, [2 1 3]);
    
    for i=1:vertical
        gray = rgb2gray(newImage);
        [Gmag, Gdir] = imgradient(gray, 'prewitt');
        seamEnergies = SeamCarves(Gmag);
        seamCoords = findLowestSeam(seamEnergies);
        originalImage = displaySeams(originalImage, seamCoords, false);
        newImage = removeSeam(newImage, seamCoords);
    end
    
    originalImage = permute(originalImage, [2 1 3]);
    newImage = permute(newImage, [2 1 3]);
    
end

