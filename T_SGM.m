%阈值分割函数,获得分割的蒙版

%输入：img：图像(灰度图像）  
% ThresH:阈值
% （为0时为二值化分割,为1时为迭代法全局阈值分割，为2时为全局阈值Otsu法阈值分割，三为基于形态学元素的局部分割,4为指定阈值分割）
%pluse：补充数据，当ThresH为3时，pluse表示形态学的元素的半径，其值越大，分割区域越大，为4时为分割的数

function output=T_SGM(img,ThresH,pluse)

img=im2double(img);%图像二值化

if ThresH==0
    output =im2double(imbinarize(I));
elseif ThresH==1
    T=0.5*(min(img(:))+max(img(:)));
    done=false;
    while ~done
       	g=(img>=T);%建立区域g，为大于阈值的部分
       	Tn=0.5*(mean(img(g))+mean(img(~g)));%当图像中g的区域与非g的区域的均值接近于目标阈值时，分割完成
       	done = abs(T-Tn)<0.1;
       	T=Tn;
    end
    output=imbinarize(img,T);
elseif ThresH==2
    Th=graythresh(img);%阈值
    output=imbinarize(img,Th);
elseif ThresH==3
    se=strel('disk',pluse);%建立形态学 结构元素
    ft=imtophat(img,se);%使用结构元素进行滤波
    Thr=graythresh(ft);%早对滤波后的图像进行阈值取值
    output = imbinarize(ft,Thr);
elseif ThresH==4
    output=imbinarize(img,pluse);
end


end

