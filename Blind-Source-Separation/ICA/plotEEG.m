function plotEEG(X, Electrodes)
    offset = max(abs(X(:))) ;
    feq = 250;
    ElecName = Electrodes.labels ;
    disp_eeg(X,offset,feq,ElecName);