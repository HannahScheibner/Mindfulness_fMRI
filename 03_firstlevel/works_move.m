% List of open inputs
nrun = 1; % enter the number of runs here
jobfile = {'C:\Users\scheibha\Documents\Mindfulness_fMRI\03_firstlevel\works_move_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
