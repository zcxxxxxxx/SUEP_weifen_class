%% 初始化参数
n = 20;
h = 1 / n;
x = 0 : h : 1;
T = 10;
tau = 0.05;
t = 0 : tau : T;
a = -3;
r = a * tau / h;
%% 

%% 内置函数
function z = g(x)
    z = x;
end

function z = L(t)
    z = 1;
end

function z = R(t)
    z = sin(t);
end