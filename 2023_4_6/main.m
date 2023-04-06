[u1,x] = convectond_diffusion(2);
[u2,x] = convectond_diffusion(-2);
d = u1(1,:) - u2(1,:);
plot(x, d);