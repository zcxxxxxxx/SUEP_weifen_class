%% 初始化参数
n = 4;
h = 1 / n;
x = 0:h:1;
T = 1;
m = 5;
tau = 1/m;
t = 0 : tau : T;
r = tau / h ^ 2
%% 初始化矩阵
% u = sparse((n + 1) * (m + 1), 1);稀疏矩阵
u = zeros((n + 1) * (m + 1), 1);
for j = 1 : m + 1
    i = 1;
    k = i + (j - 1) * (n + 1);
    u(k) = L1(t(j));
    u(k + n) = R(t(j));
end

for i = 2 : n
    u(i) = g(x(i));
end

%% 列方程
j = 2;

i = 2;
k = i + (j - 1) * (n + 1);
L = i - 1; 
A(L, L) = 1 + 2 * r;
A(L, L + 1) = -r;
b(L) = r * u(k - 1) + u(k - n - 1);

i = n;
k = i + (j - 1) * (n + 1);
L = i - 1; 
A(L, L) = 1 + 2 * r;
A(L, L - 1) = -r;
b(L) = r * u(k + 1) + u(k - n - 1);

for i = 3 : n - 1
    k = i + (j - 1) * (n + 1); % 全编号位置
%     L = i - 1 + (j - 2) * n; % 未知数位置
    L = i - 1;
    A(L, L) = 1 + 2 * r;
    A(L, L - 1) = -r;
    A(L, L + 1) = -r;
    b(L) = u(k - n - 1);
end

for j = 3 : (m + 1)
    i = 2;
    k = i + (j - 1) * (n + 1);
    L = i - 1 + (j - 2) * (n - 1);
    A(L, L) = 1 + 2 * r;
    A(L, L + 1) = -r;
    A(L, L - n + 1) = -1;
    b(L) = r * u(k - 1);

    i = n;
    k = i + (j - 1) * (n + 1);
    L = i - 1 + (j - 2) * (n - 1);
    A(L, L) = 1 + 2 * r;
    A(L, L - 1) = -r;
    A(L, L - n + 1) = -1;
    b(L) = r * u(k + 1);


    for i = 3 : n - 1
        L = i - 1 + (j - 2) * (n - 1);
        A(L, L) = 1 + 2 * r;
        A(L, L - 1) = -r;
        A(L, L - n + 1) = -1;
        A(L, L + 1) = -r;
        b(L) = 0;
    end
end

%% 解方程
utemp = A \ b';
for j = 2 : (m + 1)
% for j = 2 : 2
    get = utemp((j - 2) * 3 + 1: (j - 2) * 3 + (n - 1));
    k = 2 + (j - 1) * (n + 1);
    u(k : k + n - 2) = get;
end




size(A)
size(b)
show_s(u,n,m)
%% 内部函数



function z = g(x)
%g - Description
%
% Syntax: z = g(x)
%
%
    z = x; 
    % z = 1;
    z = 0;
end

function z = L1(t)
%L - Description
%
% Syntax: z = L(t)
%
% Long description
    z = -sin(t);
    % z = 1;
end

function z = R(t)
%myFun - Description
%
% Syntax: z = R(t)
%
% Long description
    z = cos(t);
    % z = 1;
    z = 1 - cos(t);
end

%% 辅助函数

function uu = show_s(u,n,m)
    uu = reshape(u, n + 1, m + 1);
    uu = rot90(uu);
end