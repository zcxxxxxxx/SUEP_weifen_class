function uu = show_s(u,n,m)
    uu = reshape(u, n + 1, m + 1);
    uu = rot90(uu);
end

function k = index(i , j, n)
    k = i + (j - 1) * (n + 1);
end