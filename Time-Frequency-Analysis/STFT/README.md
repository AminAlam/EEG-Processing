### Sample data

There is a sample signal named NewEEGSignal.mat which is located in datas folder. You can see this signal in the time domian and time-frequency domain in the following images.
<p align="center">
<img src="http://ee.sharif.edu/~amin/static/EEG/time_freq/signal.png" width="50%">
</p>
<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152870841-e891330f-ea49-497f-bc23-01749cb4834c.png" width="50%">
</p>

### STFT properties

For obtaining STFT from a signal, you should specify multiple parameters. I listed them below:
#### Window
You should specify which window will be used for calculating the STFT. As we know, STFT is calculated by sliding a window on the data and calculating FFT inside that window, so it is so important which window is used. Usually, kaiser and hamming windows will be used because of their properties.
#### Overlap length
This parameter specifies the number of overlap samples between two consecutive windows. Small overlap lengths may lead to high sharpness in the calculated STFT while big overlap lengths may cause longer run-times and exceeded smoothness in the STFT.
#### FFT length
For calculating the Fourier transform of a discrete signal, we use N point DFT where N is a parameter that should be specified. There is an algorithm called FFT which calculates DFT in a very fast way. So, we should specify the FFT length for calculating STFT.

Small changes in each of the mentioned parameters may tend to noticeable changes in the STFT, so it is important to specify good values as parameters based on our purpose.
