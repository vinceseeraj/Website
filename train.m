%function code = train(traindir)
% Speaker Recognition: Training Stage
%
% Input:
%       traindir : string name of directory contains all train sound files
%       n        : number of train files in traindir
%
% Output:
%       code     : trained VQ codebooks, code{i} for i-th speaker
%
% Note:
%       Sound files in traindir is supposed to be: 
%                       s1.wav, s2.wav, ..., sn.wav
% Example:
%       >> code = train('C:\data\train\', 8);

% train('data/train');
k = 16;                         % number of centroids required
for i = 1:8                     % train a VQ codebook for each speaker
    file = sprintf('%ss%d.wav', '/data/train/', i);           
    disp(file);
   
    [s, fs] = audioread(file);
    
    v = mfcc(s, fs);            % Compute MFCC's
   
    code{i} = vqlbg(v, k);      % Train VQ codebook
end
