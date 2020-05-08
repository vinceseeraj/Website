%Created made by Voice Recognition Team
%
% Speaker Recognition: Training Stage


code={4};
v={4};
fs=48000;


k = 16;                         % number of centroids required
 for i = 1:4                    % train a VQ codebook for each speaker
     file = sprintf('%ss%d.wav', '/speaking/data/train/', i);           
     disp(file);
     
    [s, fs] = audioread(file);

    v{i} = MFCC(s, fs);            % Compute MFCC's
      
   
    code{i} = vqlbg(v{i}, k);      % Train VQ codebook
 end
