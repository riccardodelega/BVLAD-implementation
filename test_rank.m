clear all, close all, clc 

load bow_db
fnames = dir('full_imgs/*.jpg');

idx_query = 1;
I = imread(strcat('full_imgs/',fnames(idx_query).name));
I = rgb2gray(I);
figure(1), subplot(221), imshow(I), subplot(222), bar(1:64, bow_db(idx_query,:));

min_dist = norm(bow_db(idx_query,:) - bow_db(7,:));
%min_dist = sum( min([bow_db(idx_query,:); bow_db(7,:)]) );
index = 7;

for kk = 1:size(bow_db,1)
    dist = norm(bow_db(idx_query,:) - bow_db(kk,:));
    %dist = sum( min([bow_db(idx_query,:); bow_db(kk,:)]) );
    if dist < min_dist && kk ~= idx_query
        min_dist = dist;
        index = kk;
        disp(['new minimum is ', fnames(kk).name, ' with distance ', num2str(dist), ' press button to go on'])
        pause
        figure(2)
        subplot(211), bar(1:64, bow_db(idx_query,:))
        subplot(212), bar(1:64, bow_db(kk,:))
    end
    I = imread(strcat('full_imgs/',fnames(kk).name));
    I = rgb2gray(I);
    figure(1)
    subplot(223), imshow(I)
    subplot(224), bar(1:64, bow_db(kk,:));
    title(num2str(dist))
end