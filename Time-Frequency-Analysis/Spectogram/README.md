### Sample data

I have created a sample chirp signal for further analysis, you can see the signal in the time domain in the following image.

<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152874118-f0334f72-65c8-4a97-8350-5a4728f9f928.png" width="50%">
</p>


### Spectogram properties

For obtaining Spectogram from a signal, you should specify multiple parameters. I listed them below:
#### Window
You should specify which window will be used for calculating the Spectogram. As we know, Spectogram is calculated by sliding a window on the data and calculating FFT inside that window, so it is so important which window is used. Usually, kaiser and hamming windows will be used because of their properties. I have plotted some famous windows in time and frequency domain below:

<p align="center">
<img width="50%" alt="windows" src="https://user-images.githubusercontent.com/50844047/152874611-2592c7d5-62b7-4609-9358-4120d3336515.png">
</p>

Also, you can see the effect of different windows on the Spectogram in the following image:


#### Overlap length
This parameter specifies the number of overlap samples between two consecutive windows. Small overlap lengths may lead to high sharpness in the calculated Spectogram while big overlap lengths may cause longer run-times and exceeded smoothness in the Spectogram.

You can see the effect of different overlap lengths on the Spectogram in the following image:


<p align="center">
<img width="50%" alt="effect_different_NOverlap" src="https://user-images.githubusercontent.com/50844047/152875370-2ceb3b85-d5e9-4e65-ac82-f96dc35a4d61.png">
</p>



#### Number of FFT points
For calculating the Fourier transform of a discrete signal, we use N point DFT where N is a parameter that should be specified. There is an algorithm called FFT which calculates DFT in a very fast way. So, we should specify the FFT length for calculating Spectogram.
You can see the effect of different number of FFT points in the following image:

<p align="center">
<img width="50%" alt="effect_different_NFFTPoints" src="https://user-images.githubusercontent.com/50844047/152875622-f5e9464f-5e41-4525-9580-24bbfd0f99a9.png">
</p>

Small changes in each of the mentioned parameters may tend to noticeable changes in the Spectogram, so it is important to specify good values as parameters based on our purpose.
