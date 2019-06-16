% 利用峰值的横坐标匹配找到混合物的可能成分。

clear;clc;close all;
[data1, name1, num1, data2, name2, num2] = extract();
cf = cell(15,1);
for i = 1:num2                                                       % 针对每一种混合物循环
    cf1 = zeros(1,1);
    temp1 = sortrows(data2{i},2,'descend');                          % 获取当前混合物数据并以纵坐标(光强)降序排序
    temp1 = temp1(:,1);                                              % 取对应的横坐标
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'*','DisplayName',char(strrep(name2(i),'.txt',''))); % 绘制混合物峰值图
    hold on;
    
    for k = 1:num1                                 % 对 20 种纯净物进行匹配
        temp2 = sortrows(data1{k},2,'descend');    % 获取纯净物峰值数据并以纵坐标(光强)降序排序
        temp2 = temp2(:,1);                        % 取对应的横坐标
        count = 0;
        for m = 1:length(temp2)                    % 混合物的峰值和数据库的特征峰进行匹配
            for j = 1:length(temp1)                
                if(abs(temp1(j)-temp2(m)) < 25)    % 若对应峰值横坐标之差在±15之间
                    count = count+1;               % 匹配成功一个峰
                    break;
                end
            end
        end
        if (count >= length(temp2))
            cf1(1,1) = cf1(1,1) + 1;
            cf1(cf1(1,1) + 1, 1) = k;
            plot(data1{k}(:,1),data1{k}(:,2),'o','DisplayName',char(strrep(name1(k),'.txt','')));
        end
    end
    cf{i} = cf1;
    legend;
end