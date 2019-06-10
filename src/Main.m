clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\峰值\试剂标准品谱图');
[data2,name2,num2] = readall_txt('..\data\峰值\混合样测试');
for i = 1:num2
    temp1 = sort(data2{i}(:,1),'descend');
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'*','DisplayName',char(strrep(name2(i),'.txt','')));
    hold on;
    for j = 1:5
        for k = 1:num1
            temp2 = sort(data1{k}(:,1),'descend');
            count = 0;
            for m = 1:2
                if(abs(temp1(j)-temp2(m)) < 50)
                    count = count + 1;
                end
            end
            if(count >= 2)
                plot(data1{k}(:,1),data1{k}(:,2),'o','DisplayName',char(strrep(name1(k),'.txt','')));
            end
        end
    end
    legend;
end