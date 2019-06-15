clear;clc;close all;
[data1,name1,num1] = readall_txt('..\data\试剂标准品谱图'); 
[data2,name2,num2] = readall_txt('..\data\混合样测试');
name1=strrep(name1,'.txt','');
name2=strrep(name2,'.txt','');
datacell=cell(1,num2);
load cf;
for i = 1:num2                  % 给混合物插值
    data(:,1) = data1{1}(:,1);
    data(:,2) = interp1(data2{i}(:,1),data2{i}(:,2),data1{1}(:,1),'spline');
    datacell{i} = data;
end

for i = 1:num2
    figure;
    plot(data2{i}(:,1),data2{i}(:,2),'DisplayName',name2{i});
    hold on;
    y = datacell{i}(:,2);             % y
    X = ones(length(y),1);            % [ones(n,1), X]
    cf1 = cf{i};                      % 成分的索引
    for j = 1:cf1(1)                  % 所有成分 
%         plot(data1{cf1(j+1)}(:,1),data1{cf1(j+1)}(:,2),'DisplayName',name1{cf1(j+1)});
        x = data1{cf1(j+1)}(:,2);     % 第一种成分
        X = [X, x];                   % 拼接   
    end
    [b,bint,r,rint,s] = regress(y,X);
    b(:,2) = 1:length(b);
    b = sortrows(b,1,'descend');
    plot(data1{cf1(b(1,2))}(:,1),data1{cf1(b(1,2))}(:,2),'DisplayName',name1{cf1(b(1,2))});
    plot(data1{cf1(b(2,2))}(:,1),data1{cf1(b(2,2))}(:,2),'DisplayName',name1{cf1(b(2,2))});
    legend;
end

