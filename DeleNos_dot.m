%输入 mask为2值化图像
%在特定区域内的分割若达不到比例，则进行消除

function output=DeleNos_dot(mask,length,Percent)

numDiv=ceil(Percent*length^2);
[ysize,xsize]=size(mask);

for i=length:xsize-length%用区域蒙版的量做判断消除杂点
    for j=length:ysize-length
        if mask(j,i)==1
            if sum(sum(mask(j-3:j+3,i-3:i+3)))<numDiv
                mask(j,i)=0;
            end
        end
    end
end
output=mask;