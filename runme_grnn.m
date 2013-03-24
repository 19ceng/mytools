%% MLP GRNN
x = [1 2 3];
t = [2.0 4.1 5.9];
net = newgrnn(x, t);
y = net(x)