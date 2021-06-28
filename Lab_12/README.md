# Image matching using SIFT & SURF features
*Date: 20.05.2021*

### Additional Requirements
-   Computer Vision Toolbox - SURF features
-   VLFeat Toolbox - SIFT features
    [VLFeat Toolbox installation guide for MATLAB](https://www.vlfeat.org/install-matlab.html)
#### Installation of VLFeat Toolbox
1.  Download the binary package of `vlfeat` to the current directory from [VLFeat - Dowload page](https://www.vlfeat.org/download.html)
1.  Unpack the file.
    Terminal(bash) command to do so on Linux systems is
    ```bash
    tar -xzvf vlfeat-0.9.21-bin.tar.gz
    ```
1.  Execute the following command in the `MATLAB Command   Window` with the current directory as the workspace directory
    ```matlab
    run('./vlfeat-0.9.21/toolbox/vl_setup')
    vl_version versbose
    ```

**Note:** vlfeat-**0.9.21** - the version number might be different on basis of future updates to the toolbox.
Personal recommendation to follow [VLFeat Toolbox installation guide for MATLAB](https://www.vlfeat.org/install-matlab.html)

### Files 
- **[ex-12--image-mathcing-using-sift-features-and-surf-features.pdf](./ex-12--image-mathcing-using-sift-features-and-surf-features.pdf):** Problem Statement for this Lab experiment
- **[SIFT.m](./SIFT.m):** MatLab code to extract SIFT features for a given image
- **[SURF.m](./SURF.m):** MatLab code to extract & visually annotate the SURF feeature & keypoints

### Output
Output of [SURF.m](./SURF.m)  
[![output-surf][su.1]][su.1]
[![output-surf-matches][su.2]][su.2]
Output of [SIFT.m](./SIFT.m)  
[![output-sift-frames-descriptors][si.1]][si.1]
[![output-sift-selected][si.2]][si.2]
[![output-sift-matches][si.3]][si.3]

### References
- [Open file selection dialog box - MATLAB uigetfile](https://www.mathworks.com/help/matlab/ref/uigetfile.html)
- [How to change the window title of a MATLAB plotting figure? - StackOverflow](https://stackoverflow.com/a/4684383)
- [How can I customize the text of the figure window title in MATLAB? - MathWorks](https://www.mathworks.com/matlabcentral/answers/94968-how-can-i-customize-the-text-of-the-figure-window-title-in-matlab-7-6-r2008a#answer_104320)
- Error: `Function IMRESIZE expected input number 2, MAP, to be a valid colormap. Valid colormaps cannot have values outside the range [0,1].` [Solution - MathWorks](https://uk.mathworks.com/matlabcentral/answers/523708-function-imresize-expected-input-number-2-map-to-be-a-valid-colormap-valid-colormaps-cannot-have#answer_430942)

[su.1]: ./output-surf.jpg
[su.2]: ./output-surf-matches.jpg
[si.1]: ./output-sift-frames-descriptors.jpg
[si.2]: ./output-sift-selected.jpg
[si.3]: ./output-sift-matches.jpg
