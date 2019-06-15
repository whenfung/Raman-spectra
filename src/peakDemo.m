clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\峰值\试剂标准品谱图');
[data2,name2,num2] = readall_txt('..\data\峰值\混合样测试');
for i = 1:num1
    plot(data1{i}(:,1),data1{i}(:,2));
    hold on;
    name1(i) = strrep(name1(i),'.txt','');
end
title('拉曼光谱(标准)');
xlabel('波数');
ylabel('光强');
legend(name1);

for i = 1:num2
    name2(i) = strrep(name2(i),'.txt','');
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'DisplayName',name2{i});
    hold on;
    for j = 1:num1
        if(contains(name2(i),name1(j)))
            plot(data1{j}(:,1),data1{j}(:,2),'DisplayName',name1{j});
        end
    end
    xlabel('波数');
    ylabel('光强');
    legend;
end