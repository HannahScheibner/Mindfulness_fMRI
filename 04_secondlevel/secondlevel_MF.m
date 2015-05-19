% List of open inputs
nrun = 1; % enter the number of runs here

computer = 3; % 1 = ubuntu, 2 = mac, 3 = windows

    if computer ==1 %ubuntu
        jobfile = {'/home/hannah/Dokumente/MF_MRTStudie/03_Auswertung/secondlevel_MF_job_simple.m'};
    elseif computer ==2 %mac
        jobfile = {};
    elseif computer ==3 %windows
        jobfile = {'C:\Users\scheibha\Documents\Mindfulness_fMRI\04_secondlevel\secondlevel_MF_job_simple.m'};
    end
    
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
