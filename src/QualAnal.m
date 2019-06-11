clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\峰值\试剂标准品谱图');%获取峰值数据
[data2,name2,num2] = readall_txt('..\data\峰值\混合样测试');
for i = 1:num2 %针对每一种混合物循环
    temp1 = sortrows(data2{i},2,'descend'); %获取当前混合物数据并以纵坐标(光强)降序排序
    temp1 = temp1(:,1);%取对应的横坐标
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'*','DisplayName',char(strrep(name2(i),'.txt','')));%绘制混合物峰值*图
    hold on;
    j = 1;
    for k = 1:num1 %针对每一种混合物循环20种纯净物
        temp2 = sortrows(data1{k},2,'descend');%获取纯净物峰值数据并以纵坐标(光强)降序排序
        temp2 = temp2(:,1);%取对应的横坐标
        count = 0;%计数
        for m = 1:4 %取纯净物前4大峰值比较
            if(abs(temp1(j)-temp2(m)) < 10) %若对应峰值横坐标之差在±10之间
                count = count + 1; %增加计数
                j=j+1; %对应一个峰值
            end
        end
        if(count >= 2) %若至少2种峰值对应 则判断当前混合物含有该纯净物 打印纯净物峰值o图
            plot(data1{k}(:,1),data1{k}(:,2),'o','DisplayName',char(strrep(name1(k),'.txt','')));
        end
    end
    legend;
end