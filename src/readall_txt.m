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