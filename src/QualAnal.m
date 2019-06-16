% 利用 cd 段的峰值趋势图匹配成分

clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\峰值\试剂标准品谱图');%获取峰值数据
[data2,name2,num2] = readall_txt('..\data\峰值\混合样测试');
for i = 1:num2                               % 针对每一种混合物循环
    pipei = zeros(20,2);
    temp1 = sortrows(data2{i},2,'descend');  %获取当前混合物数据并以纵坐标(光强)降序排序
    temp1 = temp1(:,1);                      %取对应的横坐标
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'*','DisplayName',char(strrep(name2(i),'.txt',''))); % 绘制混合物峰值*图
    hold on;
    
    for k = 1:num1                                 % 针对每一种混合物循环20种纯净物
        pipei(k, 2) = k;                           % 填编号
        temp2 = sortrows(data1{k},2,'descend');    % 获取纯净物峰值数据并以纵坐标(光强)降序排序
        temp2 = temp2(:,1);                        % 取对应的横坐标
        for m = 1:3                                % 取纯净物前3大峰值比较
            for j = 1:5                            % 混合物的前 5 高峰
                if(abs(temp1(j)-temp2(m)) < 10)    % 若对应峰值横坐标之差在±10之间
                    pipei(k,1) = pipei(k,1) + 4-m; % 权值比较
                end
            end
        end
    end
    res = sortrows(pipei, 1, 'descend');
    plot(data1{res(1,2)}(:,1),data1{res(1,2)}(:,2),'o','DisplayName',char(strrep(name1(res(1,2)),'.txt','')));
    plot(data1{res(2,2)}(:,1),data1{res(2,2)}(:,2),'o','DisplayName',char(strrep(name1(res(2,2)),'.txt','')));
    legend;
end