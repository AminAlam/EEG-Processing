### Denoising Source Separation (DSS)
DSS is a blind source separation technique that is akin to ICA, with the added functionality of that it can use prior information to unmix the signals into sources that have certain characteristics. While in ICA the defining characteristic of the sources is statistical independence, in DSS one can for instance steer the unmixing towards the identification of sources that are timelocked to certain events.

### Generalized EigenValue Decomposition (GEVD)
A generalized eigenvalue decomposition is performed on the two covariance matrices created from the two time windows. The resulting eigenvectors (matrix W) are the spatial filters, and their corresponding eigenvalues (diagonal elements of matrix Λ) encode the ratio of matrix S to R along each direction wi. These spatial filters can be used to extract main sources of the data.
