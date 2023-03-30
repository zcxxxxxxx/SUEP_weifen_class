%% 初始化参数
n = 10;
h = 1 / n;
x = 0 : h : 1;
tau = 1 / m
t = 0 : tau : 1;
r = tau / h;
%% 


%% 内置函数
function z = f(x, t)
    z = 0;
end

function z = L(t)
    z = 1;
end

function z = R(t)
    z = 1 - t;
end

function z = g(x)
    z = 1;
end