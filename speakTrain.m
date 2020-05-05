% Speaker Recognition: Training Stage
%
% Output:
%       code     : trained VQ codebooks, code{i} for i-th speaker
%
% Note:
%       Sound files in traindir is supposed to be: 
%                       s1.wav, s2.wav, ..., sn.wav
code={4};
v={4};
fs=12500;


k = 256;                         % number of centroids required
 for i = 1:4                    % train a VQ codebook for each speaker
     file = sprintf('%ss%d.wav', '/speaking/data/train/', i);           
     disp(file);
     
    [s, fs] = audioread(file);

    v{i} = MFCC(s, fs);            % Compute MFCC's
      
   
    code{i} = vqlbg(v{i}, k);      % Train VQ codebook
 end
