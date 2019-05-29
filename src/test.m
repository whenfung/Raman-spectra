clear;clc;
data = readall_txt('..\data\ÊÔ¼Á±ê×¼Æ·Æ×Í¼');
data1 = cell2mat(data(1));
plot(data1(:,1),data1(:,2))