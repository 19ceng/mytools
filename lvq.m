%% LVQ
[x,t] = iris_dataset;

net = lvqnet(10)
net = train(net,x,t);

view(net)

y = net(x);

perf = perform(net,y,t)
classes = vec2ind(y)

%% Our data
% Howto LVQ
x1 = trn.data.bauck09.X;
t1 = trn.data.y;
vt1 = ind2vec(t1);

net = lvqnet(10);
net = train(net, x1, vt1);

% error: train
y = net(x1);
y1 = vec2ind(y);
error_eval(y1, vt1)

% error: test
x2 = tst.data.bauck09.X;
t2 = tst.data.y;
vt2 = ind2vec(t2);

y = net(x2);
y2 = vec2ind(y);
error_eval(y2, t2)
