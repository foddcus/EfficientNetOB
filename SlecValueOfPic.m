function [actualaverageValue,actualNum,segama,K,S] = SlecValueOfPic(img,range,method)
%SLECVALUEOFPIC
%输入一张分割后的灰度图片；根据这这张图片的像素值统计（除零外），取中间range值的范围的内容；并返回这个范围的平均值；
%这个取值的逻辑是取像素值中间的分布，以个数划分，如10个像素取60%取平均，就是取中间值的6个像素的平均；这种方法可以提高图像反射率的数值的鲁棒性，将噪点和背景的反射屏蔽掉一部分；

%   actualavergeValue:最后输出的平均值
%   img：输入的图像
%   range：范围，大小为0-1之间；（折合百分数）
%   method:方法 1为中位数法 2为正太分布法 3为平均数法
%   actualnum:为成像面积
%   segama:偏度

segama=0;
K=0;
S=0;
if method==1
    staticD=imhist(img);
    allN=sum(staticD(2:256,1));
    rangeN=ceil(allN*range);
    thresholdNum=ceil((allN-rangeN)/2);

    thresholdValue=0;%初始化
    thresholdValueHigh=0;
    actualNum=0;

    for i=2:256%计算区间，为0的背景不算；
        nowSum=sum(staticD(2:i,1));

        if nowSum>thresholdNum
            if thresholdValue==0
                thresholdValue=i;%获得了最低门槛；
            end
        end
        if nowSum>(thresholdNum+rangeN)
            if thresholdValueHigh==0
                thresholdValueHigh=i;%获得了最高门槛；
            end
        end
    end
    allV=0;
    if thresholdValue~=0
        for j=thresholdValue:thresholdValueHigh%计算这个像素区间的平均值
            repreValue=staticD(j,1)*(j-1);%统计是从零开始统计；
            allV=allV+repreValue;
        end
        actualNum=sum(staticD(thresholdValue:thresholdValueHigh,1));
        actualaverageValue=allV/rangeN;
    else
        actualNum=0;
        actualaverageValue=0;
    end

elseif method==2%正太分布估计，此时actualnum为偏度
    [r,c]=find(img);
    [actualaverageValue,segama] = normfit(img(find(img)));
    K=kurtosis(img(find(img)));%峰度
    S=skewness(img(find(img)));%偏度
    [actualNum,~]=size(r);

elseif method==3%平均,正太分布和平均效果一致（如果符合正太分布的话);
    [r,c]=find(img);
    actualaverageValue = mean(img(find(img)),'all');
    [actualNum,~]=size(r);
end

end