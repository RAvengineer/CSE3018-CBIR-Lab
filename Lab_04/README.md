# Color Auto Correlogram Features based CBIR System
*Date: 25.02.2021*

> **ACG**: Auto-Correlogram

### Files
- **[ex-4-colour-auto-correlogram-feature-based-cbir-system.pdf](./ex-4-colour-auto-correlogram-feature-based-cbir-system.pdf):** Problem Statement for this Lab experiment
- **[acg.m](./acg.m):** MATLAB function that returns ACG features
- **[learn.m](./learn.m):** MATLAB code to test `acg` function
- **[q1.m](./q1.m):** MATLAB code implement a CBIR system using ACG features
- **[q2.m](./q2.m):** MATLAB code to measure the time taken to extract features with different configurations for the same query image
- **[rgb_image_features.xlsx](./rgb_image_features.xlsx):** Generated file containing the ACG feature values

### Output
Output of [q1.m](./q1.m) - ACG Features
[![q1-output-1][1.1]][1.1]
[![q1-output-1][1.2]][1.2]
Output of [q2.m](./q2.m) - ACG Features with different configurations for the same query image
[![q2-output-1][2.1]][2.1]
[![q2-output-2][2.2]][2.2]
[![q2-output-3][2.3]][2.3]
[![q2-output-4][2.4]][2.4]
[![q2-output-5][2.5]][2.5]

### References
- [Remove NaN values from Matrix - MathWorks](https://www.mathworks.com/matlabcentral/answers/179142-how-can-i-remove-nan-values-from-a-matrix)
- [Check number of inputs provided to the function - MathWorks](https://in.mathworks.com/matlabcentral/answers/21012-default-parameter-if-the-user-input-is-empty)

[1.1]: ./output_q1_1.jpg
[1.2]: ./output_q1_2.jpg
[2.1]: ./output_q2_1.jpg
[2.2]: ./output_q2_2.jpg
[2.3]: ./output_q2_3.jpg
[2.4]: ./output_q2_4.jpg
[2.5]: ./output_q2_5.jpg
[g1]: rgb_image_features.xlsx
[g2]: hsv_image_features.xlsx
