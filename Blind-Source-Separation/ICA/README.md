### Sample datas

I will use the same EEG data which is used in the PCA section.

### Extracting independent components of the data using ICA
Using ICA, we can extract independent sources from the data. It is noteworthy to mention that ICA has a cost function that should be specified based on the data which we are trying to denoise or extract its source. You can see the sources of the noisy data in the following image:

<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152979490-2305cf53-0050-4a6d-b6da-e513e4674733.png" width="50%">
</p>

### Denoising the data using ICA

I just keep the noise-free sources and construct the denoised signal using these sources. The original and denoised signals are plotted in the following images:


<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152979932-85c78dfd-6d20-468f-9ec8-19eae87960bc.png" width="50%">
</p>
<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152979738-38dfb610-d66f-40f5-9bad-9ee1f21be9b2.png" width="50%">
</p>
