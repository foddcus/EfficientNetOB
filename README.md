# EfficientNetOB
the EfficientNet-OB2 structure and data
Build EfficientNet-OB2 network（Build——ENetOB2）：lgraph = Build_ENetOB2(pixeN,fN,outputN)
lgraph：The Net structure  in the workspace variable lgraph.
pixeN: the data input size that you want;
fN: Number of convolution kernels of each 9 input for setting
Notice：Changing the first layer of convolution to a 3D convolution can help improve prediction accuracy, but the number of parameters will increase significantly.

The training schematic script is shown in Train_Eff... , which requires （nine one-channel fusion image） paths.



