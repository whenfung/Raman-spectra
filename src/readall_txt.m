% 用来读取数据
% path 是文件路径，格式是两列向量
% 返回值：data 细胞元组，每个细胞都是一个文件数据，文件数据是二维数组，第一列是横坐标，第二列是纵坐标
% name 是所有文件的名字
% num 是文件个数

function [data, name, num] = readall_txt(path)
A = dir(fullfile(path,'*.txt'));% 读取目录
A = struct2cell(A);% 转化元胞数组 方便读取size
[~,num] = size(A);
for k =0:num-1
	name(k+1) = A(6*k+1);% 找出name序列
end
for k = 1:num
	newpath = strcat(path,'\',name(k));
	data{k} = load(char(newpath));% 获取数据
end