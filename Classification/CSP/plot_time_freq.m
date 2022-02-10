function plot_time_freq(X, cls1_indexes, cls2_indexes, fs)
    
    X_cls1_mean = mean(X(:, :, cls1_indexes), 3);
    X_cls1_mean = mean(X_cls1_mean, 2);
    X_cls2_mean = mean(X(:, :, cls2_indexes), 3);
    X_cls2_mean = mean(X_cls2_mean, 2);
    
    figure
    subplot(2,2,1)
    plot((1:50)/fs, X_cls1_mean, 'LineWidth', 2)
    title('CLS1 - Time Domain')
    subplot(2,2,3)
    plot((1:50)/fs, X_cls2_mean, 'LineWidth', 2)
    title('CLS2 - Time Domain')

    
    subplot(2,2,2)
    stft(X_cls1_mean,fs,'Window',hamming(10,'periodic'),'OverlapLength',5,'FFTLength',fs);
    title('CLS1 - Time-Frequency Domain')
    subplot(2,2,4)
    stft(X_cls2_mean,fs,'Window',hamming(10,'periodic'),'OverlapLength',5,'FFTLength',fs);
    title('STFT CLS2 - Time-Frequency Domain')