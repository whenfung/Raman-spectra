clear;clc;
[data,name] = readall_txt('..\data\试剂标准品谱图');
for i = 1:20
    temp = cell2mat(data(i));
    plot(temp(:,1),temp(:,2))
    name(i) = strrep(name(i),'.txt','');
    hold on;
end
title('拉曼光谱')
xlabel('波数');
ylabel('光强');
legend(name);