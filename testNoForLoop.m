chars = [char(48:57),char(66),char(68),char(70:72),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];

%diffArray - detectLetter
diffArray = zeros(1,length(chars));
features = ones(1,1980);
features(1:1980) = 15;
alphabet = ones(length(chars),1980);

% diffArray(1) = sum(abs(features - alphabet(1:length(chars),:)))
% diffArray(1:length(chars)) = sum(abs(features - alphabet(1:length(chars),:)));

for i=1:length(chars)
    diffArray(i) = sum(abs(features - alphabet(i,:)));
end


%filenames - getAlphabet
%For each char, make the string of it's image filname
charImgString = zeros(1,length(chars));
charImgString(1:length(chars)) = strcat('lettersNumbers/',1:length(chars));
charImgString(1:length(chars)) = strcat(charImgString(1:length(chars)),'.PNG');
    