![image](https://github.com/user-attachments/assets/2d6e5b11-4228-47e3-8479-61a0c24dfd2b)
# EfficientNetOB
the EfficientNet-OB2 structure and data
Build EfficientNet-OB2 network（Build——ENetOB2）：lgraph = Build_ENetOB2(pixeN,fN,outputN)
lgraph：The Net structure  in the workspace variable lgraph.
pixeN: the data input size that you want;
fN: Number of convolution kernels of each 9 input for setting


The training schematic script is shown in Train_Eff... , which requires （nine one-channel fusion image） paths.


The Fusion process code was show in file images fusion,and it also was introduced at  https://blog.csdn.net/m0_47787372/article/details/134970406?spm=1001.2014.3001.5501


Image of PCA-WA (The PC channels 1 to 3 are mapped to RGB.）
![image](https://github.com/user-attachments/assets/d3cc372d-dfce-4cd0-ba82-a2d1dc723895)


Image of multicolor fluorensence
![image](https://github.com/user-attachments/assets/f439d06c-dbe2-4a72-82b9-06d83cd21838)



