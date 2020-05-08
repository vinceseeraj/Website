%Created made by Voice Recognition Team
%
% Speaker Recognition: Testing Stage

myVoice = audiorecorder(48000,16,1);
 
%Show when recording starts and ends
myVoice.StartFcn = 'disp(''Start speaking.'')';
record(myVoice, 1);

myVoice.StopFcn = 'disp(''End of recording.'')';
 y = getaudiodata(myVoice);
%  Writes data to a new file so it can be read by audio file
audiowrite('/DSP/speaking/newVoice.wav', y, 48000);


fs=48000;

   file = sprintf('%snewVoice.wav', '/DSP/speaking/');
    [s, fs] = audioread(file);
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
