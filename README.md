# Blur Measurement for Partially Blurred Image with Saliency Constrained Global Refinement

This software demos the algorithm in the paper [Blur Measurement for Partially Blurred Image with Saliency Constrained Global Refinement](https://fangxianyong.github.io/home/papers/pcm18blurmeasurement.pdf) by Xianyong Fang et al. in PCM 2018. Please check 'demo.m' for more details.

The code is tested in MATLAB 2016a (64bit) under the MS Windows 7 64bit version. Lower version of Matlab may cause several errors.
For algorithmic details, please refer to our paper. 

-------------------------------------------------------
## Additioanl acknowledgement:
1. Saliency detection code:
Huaizu Jiang, Jingdong Wang, Zejian Yuan, Yang Wu, Nanning Zheng, Shipeng Li.
Salient Object Detection: A Discriminative Regional Feature Integration Approach. CVPR, 2013
http://supermoe.cs.umass.edu/~hzjiang/drfi/
https://github.com/playerkk/drfi_matlab

2. HiFST code:
S. Alireza Golestaneh, Lina J. Karam
Spatially-Varying Blur Detection Based on Multiscale Fused and Sorted Transform Coefficients of Gradient Magnitudes. CVPR 2017
https://github.com/isalirezag/HiFST

3. SLIC code:
VLFeat (http://www.vlfeat.org/). 

4. The test images:
Jianping Shi, Li Xu, Jiaya Jia
Discriminative Blur Detection Features. CVPR 2014.
http://www.cse.cuhk.edu.hk/~leojia/projects/dblurdetect/index.html

-------------------------------------------------------
Please install VLFeat first.

## Files included
The purpose of each file inlcuded are as follows:
demo.m                  The main program
HiFST.m                 Computing HiFST
get_neighbors.m         Estimating the neighbors of a superpixel
predict.m               Estimating the blur degree using BP neural network
comp_extreme_point.m    Computing the extreme point
comp_data.m             Computing the 10-element vector input into the BP classifier
comp_averger.m          Estimating the saliency and blur dgree of each superpixel
bilateral_function.m    Bilateral filter


## Citation

If you use this code and its associated data (e.g. images) in your work, please cite the following paper. Thanks.

X. Fang, Q. Guo, C. Ding, L. Wang, and Z. Deng. 
[Blur Measurement for Partially Blurred Image with Saliency Constrained Global Refinement](https://fangxianyong.github.io/home/papers/pcm18blurmeasurement.pdf). 
PCM 2018, 2018.
