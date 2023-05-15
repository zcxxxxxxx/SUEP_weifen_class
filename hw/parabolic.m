%% 初始化
student_id = 20202297;
% student_id = 0;
a = 1; % 常数
n = 4;
T = 1;
m = 5;
h = 1 / n;% x轴上的步长
x = 0 : h : 1;% x轴上的点
tau = T / m;% y轴上的步长
t = 0 : tau : T;% y轴上的点
%%
u = zeros(n, m);
u(:,1) = student_id; % 初始条件

% 迭代求解
for j = 2:m
    % 内部网格点更新
    for i = 2:n-1
        u(i,j) = u(i,j-1) + (tau/(h^2)) * (u(i+1,j-1) - 2*u(i,j-1) + u(i-1,j-1));
    end

    % 边界条件更新
    u(1,j) = 0; % 左边界
    u(n,j) = 0; % 右边界
end
u
plot(x, u(1,:));