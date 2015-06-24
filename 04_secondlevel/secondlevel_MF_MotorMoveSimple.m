% List of open inputs
% Factorial design specification: Directory - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'C:\Users\scheibha\Documents\Mindfulness_fMRI\04_secondlevel\secondlevel_MF_MotorMoveSimple_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(1, nrun);
designdirectory = {'F:\MF_MRTStudie\01_Daten\ModelMotormoveSimple'};
for crun = 1:nrun
    inputs{1, crun} = designdirectory; % Factorial design specification: Directory - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
