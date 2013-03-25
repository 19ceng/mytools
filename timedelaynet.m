%% timedelaynet
[X,T] = simpleseries_dataset;
net = timedelaynet(1:20, 50)
[Xs,Xi,Ai,Ts] = preparets(net,X,T)
net = train(net,Xs,Ts,Xi,Ai);
view(net)
Y = net(Xs,Xi,Ai);
perf = perform(net,Ts,Y)

figure(1);
plot([T{:}]);
hold on;
plot([Y{:}], 'r*-')