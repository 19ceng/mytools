%% MLP-PNN
X = [1 2 3 4 5 6 7];
Tc = [1 2 3 2 2 3 1];
T = ind2vec(Tc);

net = newpnn(X,T);

Y = net(X);
Yc = vec2ind(Y);

[Tc' Yc']