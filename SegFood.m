function [R, E, J] = SegFood(I, p)
%
% Usage
%   I = imread('E:\Github\kurupelit\12_yaprak_for_our_databases\_\db\ekinezya\e03 15.6.jpg');
%   [R, E, J] = SegFood(I);
%   figure(1);
%   subplot(221);   imshow(I);
%   subplot(222);   imshow(R);
%   subplot(223);   imshow(E);
%   subplot(224);   imshow(J);
J = rgb2hcm(double(I) / 256);
t = graythresh(J);

if(~exist('p'))
    p = -0.05;
end

[R, E] = MorhoFood(J, t+p);

%% Helpers
function J = rgb2hcm(RGB)
if(size(RGB,3)==1)
    I = RGB;
else
    RGB64 = imresize(RGB, [64 4]);
    k = fminsearch(@StdMonochrome, [1 1], [], RGB64);
    I = k(1)*RGB(:,:,1) + k(2)*RGB(:,:,2) + RGB(:,:,3);
end
J = I - min(I(:));
J = J/max(J(:));
n = fix(size(J,1)/4);

if(mean2(J(1:n, 1:n)) > 0.3)
    J = 1 - J;
end

function s = StdMonochrome(k, RGB)
I = k(1)*RGB(:,:,1) + k(2)*RGB(:,:,2) + RGB(:,:,3);
s = -std2(I)/(max(I(:)) - min(I(:)));

function [R, E]= MorhoFood(J, t)
A = bwareaopen(J>t, fix(length(J(:))/100));
C = imclose(A, strel('disk', 7));
R = bwfill(C, 'holes', 8);
E = bwperim(R, 4);
