% Generating a chirp signal for furthur analysis
clc
clear
f_t = @(t) 100+100/3*t.^2;
x_t = @(t) cos(2*pi*f_t(t).*t);
time_interval = 2;
fs = 1000;

time = 0:1/fs:time_interval;
sig = x_t(time);
sig2 = chirp(time,100,1,400,'quadratic');

plot(time, sig, 'linewidth', 1)
xlabel('Time (s)'); ylabel('Signal')
title('Generated Chirp Signal')

%% making different windows for fourirer analysis
L = 128;
rectWin = rectwin(L); triangWin = triang(L); gaussWin = gausswin(L); hammingWin = hamming(L);
wvtool(rectWin, triangWin, gaussWin, hammingWin)

%% Effect of different windows on Spectogram
noverlap = 0; nfft = L;

subplot(2,2,1)
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window')

subplot(2,2,2)
spectrogram(sig, triangWin, noverlap, nfft, fs);
title('Triang Window')

subplot(2,2,3)
spectrogram(sig, gaussWin, noverlap, nfft, fs);
title('Gauss Window')

subplot(2,2,4)
spectrogram(sig, hammingWin, noverlap, nfft, fs);
title('Hamming Window')

%% Effect of number of overlap samples on spectogram

noverlap = 0;
subplot(4,4,[1,2,5,6])
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window - noverlap = 0')

noverlap = 64;
subplot(4,4,[3,4,7,8])
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window - noverlap = 64')

noverlap = 127;
subplot(4,4,[10,11,14,15])
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window - noverlap = 127')

%% Effect of window length on spectogram
clc
L = 32; noverlap = L-1; nfft=L;
subplot(4,4,[1,2,5,6])
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window | L = 32 |noverlap = 31')

L = 128; noverlap = L-1; nfft=L;
subplot(4,4,[3,4,7,8])
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window | L = 128 |noverlap = 127')

L = 512; noverlap = 127; nfft=L;
subplot(4,4,[10,11,14,15])
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window | L = 512 |noverlap = 127')

%% Effect of number of fft points of spectogram

L = 128; noverlap = L/2; nfft=L;
subplot(4,4,[1,2,5,6])
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window | nfft = L')

L = 128; noverlap = L/2; nfft=2*L;
subplot(4,4,[3,4,7,8])
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window | nfft = 2L')

L = 128; noverlap = L/2; nfft=4*L;
subplot(4,4,[10,11,14,15])
spectrogram(sig, rectWin, noverlap, nfft, fs);
title('Rect Window | nfft = 4L')
