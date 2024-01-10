
function data = AverageOneSample(Sample,EX)
%主要是求图像校正后，分割后的平均值
%EX为1*2的double 分别代表范围和取值的方法 默认【0.6，3】

%[actualaverageValue,actualNum,segama,K,S] = slecValueOfPic(img,range,method)
%SLECVALUEOFPIC
%输入一张分割后的灰度图片；根据这这张图片的像素值统计（除零外），取中间range值的范围的内容；并返回这个范围的平均值；
%   actualavergeValue:最后输出的平均值
%   img：输入的图像
%   range：范围，大小为0-1之间；
%   method:方法 1为中位数法 2为正太分布法 3为平均数法，基本上2和3一致
%   actualnum:为成像面积
%   segama:偏度

[x,y,z]=size(Sample);
for i=1:z
    [data(i,1),data(i,2),~,~,~] = SlecValueOfPic(Sample(:,:,i),EX(1),EX(2));
end



end