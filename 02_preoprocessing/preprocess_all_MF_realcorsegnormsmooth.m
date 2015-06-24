% List of open inputs
% Realign: Estimate & Reslice: Data - cfg_repeat
% Coregister: Estimate & Reslice: Reference Image - cfg_files
% Coregister: Estimate & Reslice: Source Image - cfg_files
% Segment: Volumes - cfg_files
% Normalise: Estimate & Write: Image to Align - cfg_files
% Normalise: Estimate & Write: Images to Write - cfg_files
% Normalise: Estimate & Write: Image to Align - cfg_files
% Normalise: Estimate & Write: Images to Write - cfg_files
% Smooth: Images to Smooth - cfg_files
nrun = X; % enter the number of runs here
jobfile = {'C:\Users\scheibha\Documents\Mindfulness_fMRI\02_preoprocessing\preprocess_all_MF_realcorsegnormsmooth_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(9, nrun);
for crun = 1:nrun
    inputs{1, crun} = MATLAB_CODE_TO_FILL_INPUT; % Realign: Estimate & Reslice: Data - cfg_repeat
    inputs{2, crun} = MATLAB_CODE_TO_FILL_INPUT; % Coregister: Estimate & Reslice: Reference Image - cfg_files
    inputs{3, crun} = MATLAB_CODE_TO_FILL_INPUT; % Coregister: Estimate & Reslice: Source Image - cfg_files
    inputs{4, crun} = MATLAB_CODE_TO_FILL_INPUT; % Segment: Volumes - cfg_files
    inputs{5, crun} = MATLAB_CODE_TO_FILL_INPUT; % Normalise: Estimate & Write: Image to Align - cfg_files
    inputs{6, crun} = MATLAB_CODE_TO_FILL_INPUT; % Normalise: Estimate & Write: Images to Write - cfg_files
    inputs{7, crun} = MATLAB_CODE_TO_FILL_INPUT; % Normalise: Estimate & Write: Image to Align - cfg_files
    inputs{8, crun} = MATLAB_CODE_TO_FILL_INPUT; % Normalise: Estimate & Write: Images to Write - cfg_files
    inputs{9, crun} = MATLAB_CODE_TO_FILL_INPUT; % Smooth: Images to Smooth - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
