%% LVQ
[x,t] = iris_dataset;

net = lvqnet(10)
net = train(net,x,t);

view(net)

y = net(x);

perf = perform(net,y,t)
classes = vec2ind(y)