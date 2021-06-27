# Color Feature Extraction from Images
*Date: 11.02.2021*

### Files
- **[q1.m](./q1.m):** MATLAB code to read & display an image
- **[q2.m](./q2.m):** MATLAB code to read & display an image in HSV, RGB, CMY & Grayscale mapping
- **[q3.m](./q3.m):** MATLAB code to execute color plane slicing in RGB color space
- **[q4.m](./q4.m):** MATLAB code to extract statistical features like mean, standard deviation, variance, skewness, kurtosis in each of the plane of R, G, B
- **[q5.m](./q5.m):** MATLAB code to store the calculations from [q4.m](./q4.m) for all images in the given image set in an XLS file named `image_features.xls`

### Output
**Output of q4.m**
```
Size: 1080×1920×3	Height: 1080	Width: 1920	No. of channels: 3

Mean for channel:
Red: 59.577845	Green: 54.632606	Blue: 88.810405

Standard Deviation for channel:
Red: 61.066365	Green: 53.543544	Blue: 51.052430

Variance for channel:
Red: 3729.102785	Green: 2866.912520	Blue: 2606.351873

Skewness for channel:
Red: 0.123737	Green: 0.128874	Blue: 0.131954

Kurtosis for channel:
Red: 0.014476	Green: 0.015559	Blue: 0.016299
```
**Output of q5.m - [image_features.xls](./image_features.xls):** Generated file containing the calculated image features
