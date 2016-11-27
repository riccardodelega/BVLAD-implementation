clc
clear
close all

load Centroidi.mat
plot_figure = 0; % togliere parfor se questo è true per vedere immagine, BRISK e bow

fnames = dir('full_imgs/*.jpg');
numfids = length(fnames);

bow_db = [];

h = waitbar(0, 'Computing...');
tic;
parfor k = 1:round(numfids*0.1)
    I = imread(strcat('full_imgs/',fnames(k).name));
    I = rgb2gray(I);
    points = detectBRISKFeatures(I, 'MinContrast', 0.05, 'MinQuality', 0.05);
    [features, valid_points] = extractFeatures(I, points, 'Method', 'BRISK');
    binary_features = BriskPoint2Binary(features);
    
    if isempty(valid_points) % per il soffitto non trova punti validi
        disp(fnames(k).name); % immagine problematica
        continue % ignora quest'immagine
    end
    
    b = BOW(binary_features, C);
    
    if plot_figure == 1 
        subplot(211)
        imshow(I); hold on;
        plot(points.selectStrongest(20));
        subplot(212)
        bar(1:size(C,1), b), pause
    end
    bow_db = [bow_db; b];
    waitbar(k/numfids);
end
toc
close(h)

save('bow_db.mat', 'bow_db')
