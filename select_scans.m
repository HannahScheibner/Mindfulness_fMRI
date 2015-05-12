
% -------------------------------
% subfunction for selecting scans
% -------------------------------



function [files] = select_scans(file_filt, direc)

x     = []; x     = spm_select('List', direc, file_filt);
y     = []; y     = [repmat([direc filesep], size(x, 1), 1) x repmat(',1', size(x, 1), 1)];
files = []; files = mat2cell(y, ones(size(y, 1), 1), size(y, 2));