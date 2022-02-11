### Sample datas

I used [BCI2003](https://www.bbci.de/competition/iii/) data [2 classes, 316 training and 100 test trials of 28 EEG channels and 500 samples, sampling frequency 100Hz].

### CSP

Common spatial pattern (CSP) is a mathematical procedure used in signal processing for separating a multivariate signal into additive subcomponents which have maximum differences in variance between two windows.

### Results

I have applied CSP to the data and plotted the results in the following images.

Before CSP:
<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/153436073-17065cee-d8d4-48ad-859f-28d481e256e2.png" width="50%">
</p>

After CSP:
<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/153435979-e5144915-69b8-4cd3-9b21-df4297d55b37.png" width="50%">
</p>

The plots belong to the average of all trials and all channels of the data. As can be seen in the figures, after applying CSP, the classes have noticeable differences in time and time-frequency domains.
