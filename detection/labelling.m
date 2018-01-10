function a = labelling
rgb = imread('../images/1.JPG');
im = 0.8*rgb(:,:,1) + 0.8*rgb(:,:,2) + 0.4*rgb(:,:,3);
    
% smooth the image
sigma = 8;      % how much to smooth
hmasksize = ceil(2.6 * sigma);    % reasonable half mask size relative to sigma
masksize = 2*hmasksize + 1; % mask size odd number so it has a centre
mask = fspecial('gauss', masksize, sigma); %create a filter
imsmooth = conv2(double(im), mask, 'valid'); %convolutes filter matrix with the image and leaves zero-padded edges out
% find horizontal differences, to pick out vertical edges
hordiffs = imsmooth(:, 1:end-1) - imsmooth(:, 2:end);
% find the biggest absolute difference
[colmxs, rs] = max(abs(hordiffs),[],1); 
[mx, c] = max(colmxs);
r = rs(c);
% correct for the trimming during the convolution
c = c + hmasksize;
r = r + hmasksize;
% show the peak location
imshow(im);
hold on;
plot(c, r, 'r^');
hold off;
end