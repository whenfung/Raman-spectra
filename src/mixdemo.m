clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\试剂标准品谱图');
[data2,name2,num2] = readall_txt('..\data\混合样测试');
name1 = strrep(name1,'.txt','');
name2 = strrep(name2,'.txt','');

for i = 1:num2
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'DisplayName',name2{i});
    hold on;
    sum = zeros(1601,1);
    for j = 1:num1
        if(contains(name2{i},name1{j}))
%             plot(data1{j}(:,1),data1{j}(:,2),'DisplayName',name1{j});
            k = strfind(name2{i},name1{j});
            a = str2num(name2{i}(k+length(name1{j}):k+1+length(name1{j})))/100;
            sum = sum + data1{j}(:,2)*a;
%             plot(data1{j}(:,1),data1{j}(:,2)*a,'DisplayName',strcat(name1{j},num2str(a)));
        end
    end
    plot(data1{j}(:,1),sum,'DisplayName','混合后');
    xlabel('波数');
    ylabel('光强');
    legend;
end