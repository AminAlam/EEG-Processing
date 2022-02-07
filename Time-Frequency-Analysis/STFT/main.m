% loading sample data
clc
clear
load('NewEEGSignal.mat');
fs_256 = 256;

%% showing the signal in time domain and time-frequency domain

% Tima Domain
sigg = NewEEGSignal;
time = (1:length(sigg))/fs_256;
figure
plot(time, sigg, 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Signal')
title('Signal in the Time Domain')

% STFT
figure
L = 16;
stft(sigg,fs_256,'Window',kaiser(L,5),'OverlapLength',L/2,'FFTLength',2*L);
ylim([0,100])
title('STFT of the signal')

%% lowpass filtering the signal [64Hz]
clc
fs_128 = 128;
EEG_LowPassFilt = lowpass(NewEEGSignal,fs_128/2,fs_256);
EEG_ds = downsample(EEG_LowPassFilt, 2);

sigg = EEG_ds;
time = (1:length(sigg))/fs_128;
figure
plot(time, sigg, 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Signal')
title('Signal in the Time Domain')


% STFT
figure
L = 16;
stft(sigg,fs_128,'Window',kaiser(L,5),'OverlapLength',L/2,'FFTLength',2*L);
ylim([0,64])







