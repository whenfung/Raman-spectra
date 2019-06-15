function [result1, name1, num1, result2, name2, num2] = extract()
    [data1,name1,num1] = readall_txt('..\data\试剂标准品谱图');
    [data2,name2,num2] = readall_txt('..\data\混合样测试');
    
    % 试剂峰值提取
    N = 10;
    Q = 2000;
    result1 = cell(1, num1);
    for i = 1:num1
        peaks = zeros(1,2);
        sum = 0;
        for j = N+1:length(data1{i})
            if data1{i}(j, 2) < Q
                continue;
            end
            [~,index] = max(data1{i}(j-N:j+N, 2));
            if index == N
                sum = sum + 1;
                peaks(sum,1) = data1{i}(j-1,1);
                peaks(sum,2) = data1{i}(j-1,2);
            end
        end
        result1{i} = peaks;
    end

    % 混合物峰值提取
    N1 = 3;
    Q1 = 1000;
    result2 = cell(1, num2);
    for i = 1:num2
        peaks = zeros(1,2);
        sum = 0;
        for j = N1+1:length(data2{i})
            if data2{i}(j, 2) < Q1
                continue;
            end
            [~,index] = max(data2{i}(j-N1:j+N1, 2));
            if index == N1
                sum = sum + 1;
                peaks(sum,1) = data2{i}(j-1,1);
                peaks(sum,2) = data2{i}(j-1,2);
            end
        end
        result2{i} = peaks;
    end
end