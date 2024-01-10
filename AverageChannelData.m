%检查文件数量是否匹配
function allData=AverageChannelData(aimPath,numchannel,IFSGM)

%输入部分
%aimPath：采集目标的路径
%aimPath='F:\23新疆大田数据校正后\SSS';%目标路径，得用单引号"
%IFSGM 大小为1*2，(1,1)若为1则执行基于荧光的分割，(1,2)为红色荧光所在的位置

orinPath=cd();%函数执行所在的路径，默认原路径
%目标文件
srcDir=dir(aimPath); %获得选择的文件夹
[numFile,~]=size(srcDir);
data=zeros(numchannel,2);
for j=3 :numFile
    names_Fir=srcDir(j).('name');
    newfile_Fir=[aimPath,'\',names_Fir];%数据文件名
    load(newfile_Fir);
    if IFSGM(1,1)==1
        tureMask=T_SGM(Map_uint8(a(:,:,3),min(min(a(:,:,3))),max(max(a(:,:,3)))),4,0.045);%图像分割
        tureMask2=DeleNos_dot(tureMask,10,0.2);%清理噪点
        [yn,xn,zn]=size(a);
        b=zeros(yn,xn,zn);
        for i=1:numchannel
            b(:,:,i)=a(:,:,i).*tureMask2;
        end
    else
        b=a;
    end
    data = AverageOneSample(b,[0.6,3]);
    allData(j-2,1:numchannel)=data(1:numchannel,1)';
end


end