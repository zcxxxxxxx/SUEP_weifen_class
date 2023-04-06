function [u,x] = convectond_diffusion(a)
%% 初始化参数
n = 5;
h = 1 / n;
x = 0 : h : 1;
m = 1000;
tau = 1 / m;
t = 0 : tau : 1;
% a = 1;
c = 9;
r1 = a * tau / (2 * h);
r2 = c * tau / h ^ 2;

%% 
u = zeros((m + 1) ,(n + 1));
for i = 1 : (n + 1)
    u(1, i) = g(x(i));
end

for j = 2 : (m + 1)
    u(j , 1) = L(t(i));
    u(j, n + 1) = R(t(j));
end

for j = 2 : m + 1
    for i = 2 : n
        u(j, i) = (r2 + r1) * u(j - 1, i - 1) + (1 - 2 * r2) * u(j - 1, i) + (r2 - r1) * u(j - 1, i + 1);
    end
end

u = flip(u)
    
%% 
function z = g(x)
    z = 1;
end

function z = L(t)
    z = cos(t);
end

function z = R(t)
    z = 1 - 5 * sin(t);
end

end