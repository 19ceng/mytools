%% Example: LDA
in_data = load('iris');

model = lda( in_data, 2 );
out_data = linproj( in_data, model);

% Show
figure(1);  ppatterns(in_data);
figure(2);  ppatterns(out_data);