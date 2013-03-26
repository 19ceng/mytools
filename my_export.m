function my_export(h, fnm, etype)
% function my_export(h, fnm, etype)
% 
% IN:
%   h: gcf
%   fnm: file name
%   etype: export/extension type
% OUT:
%   fnm.ext

if strcmp(etype, 'all')
    ETYPES = {'jpg', 'eps', 'tif', 'png'};
    for i=1:length(ETYPES)
        helper(h, fnm, ETYPES{i});
    end
else
    helper(h, fnm, etype);
end

%% Helpers
function helper(h, fnm, etype)
resolution = '-r600';

switch etype
    case {'jpg', 'jpeg'}
        device = '-djpeg';
    case 'eps'
        device = '-deps';
    case 'tif'
        device = '-dtiff';
    case 'png'
        device = '-dpng';
end

print(h, device, resolution, fnm);
