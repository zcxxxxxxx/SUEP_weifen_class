function heatconduction(a, n, T, m)
%% 初始化 
    h = 1 / n;% x轴上的步长
    x = 0 : h : 1;% x轴上的点   
    tau = T / m;% y轴上的步长
    t = 0 : tau : T;% y轴上的点 
%% 
    r = a ^ 2 * tau / h ^ 2; % 网格比例
    u = zeros((n + 1) * (m + 1), 1); % 初始化一维索引
%% 赋边界初值
    for j = 1 : m + 1
        if j == 1 % 初始化第一层
            for i = 1 : n + 1
                k = i + (j - 1) * (n + 1);
                u(k) = g(x(i));
            end
        else
            kL = 1 + (j - 1) * (n + 1);
            u(kL) = h1(t(j));
            u(kL + n) = h2(t(j));
        end
    end

%% 内部赋值
    for j = 2:(m + 1)
        for i = 2 : n
            k = i + (j - 1) * (n + 1);
            u(k) = -r * u(k - n - 2) + (1 + 2 * r) * u(k - n - 1) - r * u(k - n);
        end
    end

    U = print(u, m, n);
    plot(x, U(1,:));
    

end

function U = print(u, m, n)
    % U = rot90(reshape(u, m + 1, n + 1))
    U = reshape(u, m + 1, n + 1);
    
end

%% 边界函数
function z = f(x, t)
    z = 0;
end
    
function z = g(x)
    z = 1;
end    
    
function z = h1(t)
    % 边界条件
    % z = 1;     
    % if t == 0 
    %     z = 1;
    % else
    %     z = 0;     
    % end
    z = 2 + sign(t);
end
    
function z = h2(t)
    % 边界条件
    % z = 1;       
    % if t == 0 
    %     z = 1;
    % else
    %     z = 0;     
    % end    
    z = 2 + sign(t);
end