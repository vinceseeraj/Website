function speaking(~, ~, code)
% Speaker Recognition: Testing Stage
%
% Input:
%       testdir : string name of directory contains all test sound files
%       n       : number of test files in testdir
%       code    : codebooks of all trained speakers
%
% Note:
%       Sound files in testdir is supposed to be: 
%               s1.wav, s2.wav, ..., sn.wav
%

myVoice = audiorecorder(48000,16,1);

% Define callbacks to show when
% recording starts and completes.
myVoice.StartFcn = 'disp(''Start speaking.'')';
record(myVoice, 1);

myVoice.StopFcn = 'disp(''End of recording.'')';
 y = getaudiodata(myVoice);
audiowrite('/Users/traviscooper/Documents/DSP/speaking/newVoice.wav', y, 44800);

fs=48000;

   file = sprintf('%snewVoice.wav', '/Users/traviscooper/Documents/DSP/speaking/');
    samples = [1,1*fs];
    [s, fs] = audioread(file,samples);      
    sound(s,fs);   
    v  = MFCC(s, fs);            % Compute MFCC's
   
    distmin = inf;
    k1 = 0;
   
    for l = 1:length(code)      % each trained codebook, compute distortion
        d = disteu(v, code{l}); 
        dist = sum(min(d,[],2)) / size(d,1);
      
        if dist < distmin
            distmin = dist;
            k1 = l;
        end      
    end
   
    msg=sprintf('Speaker myVoice matches with speaker %d', k1);
   disp(msg);