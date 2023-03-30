function uu = show_s(u,n,m)
    uu = reshape(u, n + 1, m + 1);
    uu = rot90(uu);
end