n = 4;
h = 1 / n;
x = 0:h:1;
T = 1;
m = 5;
tau = 1/m;
t = 0 : tau : T;
r = tau / h ^ 2;

% 初始化解向量
u = zeros(n, m );
side = 20202297;
u(:,1) = side; % 左边界
u(:,m) = side; % 右边界
u(1,:) = side; % 上边界
u(n,:) = side; % 下边界

% 迭代求解 
    % 内部网格点更新
for i = 2:n-1
    for j = 2:m-1
        u(i,j) = (u(i+1,j) + u(i-1,j) + u(i,j+1) + u(i,j-1)) / 4;
    end
end
u