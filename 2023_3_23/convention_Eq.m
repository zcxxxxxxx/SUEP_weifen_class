%% 初始化参数
n = 5;
m = 5
h = 1 / n;
x = 0 : h : 1;
tau = 1 / m;
t = 0 : tau : 1;
r = tau / h;
%% 
% G_solution = sparse(m + 1, n + 1)
G_solution = zeros(m + 1, n + 1)
for j = 1 : m + 1
    for i = 1 : n + 1
        % k = index(i, j, n);
        if t(j) >= x(i)
            G_solution(j, i) = L(t(j) - x(i));
        else
            G_solution(j, i) = 1;
        end
    end
    
end

% u = sparse(m + 1, n + 1); 
% G_solution = ones(m + 1, n + 1)
u = zeros((m + 1) * (n + 1), 1);


%% 边界条件和初始条件
for i = 1 : (n + 1)
    k = index(i, 1, n);
    u(k) = g(x(i));
end

i = 1
for j = 1 : (m + 1)
    k = index(i, j, n);
    u(k) = L(t(j));
    u(k + n) = R(t(j));
end

%% 内部点
for j = 2 : (m + 1)
    for i = 2 : n
        k = index(i, j, n);
        u(k) = r * u(k - n - 2) + (1 - r) * u(k - n - 1) + tau * f(x(i), t(j));
    end
end

show_s(u , n, m)


%% 内置函数
function k = index(i , j, n)
    k = i + (j - 1) * (n + 1);
end

function z = f(x, t)
    z = 0;
end

function z = L(t)
    z = 1;
end

function z = R(t)
    z = 1;
end

function z = g(x)
    z = 1;
end