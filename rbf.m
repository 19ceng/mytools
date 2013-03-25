%% RBF
X = [1 2 3];
T = [2.0 4.1 5.9];

% Network
net = newrb(X, T, 0.0, 1.0, size(X, 2));

% Test
Y = net(X)
