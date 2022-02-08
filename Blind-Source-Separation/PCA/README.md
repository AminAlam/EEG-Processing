### Sample datas

I will use two different data, the first one will be used to show the principles of the PCA and application of the PCA in whitening the data. The second one is EEG data which will be used to show PCA performance in denoising the data.


### Extracting Principle components of the data
Using PCA, we can extract the principal components of the data. You can see in the image below that the biggest component is aligned with the direction where the data has the biggest variance.

<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152974572-ed609718-78db-4012-a924-ef073cf2eac9.png" width="50%">
</p>

### Whitening data
PCA can be used for whitening the data. A whitening transformation is a decorrelation transformation that transforms a set of random variables into a set of new random variables with identity covariance (uncorrelated with unit variances). You can see the original data and PCA whitened data in the following images.

<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152976594-e40c2ee4-449c-49fe-ad11-83d2bb62ae3c.png" width="50%">
</p>

### Denoising EEG data using PCA
You can see the noise-free EEG data in the following image:

<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152977077-f084ccb3-af04-4ef1-97f8-14adce8ce7af.png" width="50%">
</p>

I added random noise to the data. Data after adding the noise:

<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152977364-0fb03b0e-f826-48f0-8819-2304f48767b9.png" width="50%">
</p>

Using PCA, all principle components of the data is extracted:

<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152977622-3e872a1f-bb92-4744-9b68-4bf0cc6e33c4.png" width="50%">
</p>

I will keep the components that have the most information about the noise-free signal and construct the denoised signals using those components:

<p align="center">
<img src="https://user-images.githubusercontent.com/50844047/152977888-37b3f8f8-44c1-4070-bfbc-346e63d5dd83.png" width="50%">
</p>

As can be seen in the image above, PCA doesn't work very well in denoising data and it is better to use PCA for dimension reduction and whitening. You can find the ICA method in my repo, this method works far better than PCA in denoising data.
