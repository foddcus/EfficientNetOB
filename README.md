# EfficientNetOB
the EfficientNet-OB2 structure and data
Build EfficientNet-OB2 network（Build——ENetOB2）：lgraph = Build_ENetOB2(pixeN,fN,outputN)
lgraph：The Net structure  in the workspace variable lgraph.
pixeN: the data input size that you want;
fN: Number of convolution kernels of each 9 input for setting


The training schematic script is shown in Train_Eff... , which requires （nine one-channel fusion image） paths.


The Fusion process code was show in file images fusion,and it also was introduced at  https://blog.csdn.net/m0_47787372/article/details/134970406?spm=1001.2014.3001.5501
