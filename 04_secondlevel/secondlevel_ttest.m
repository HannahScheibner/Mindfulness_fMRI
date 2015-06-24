% List of open inputs
% Factorial design specification: Directory - cfg_files
% Factorial design specification: Scans - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'C:\Users\scheibha\Documents\Mindfulness_fMRI\04_secondlevel\secondlevel_ttest_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);

        filename = 'F:\MF_MRTStudie\01_Daten\Probanden\';
        designdirectory = {'F:\MF_MRTStudie\01_Daten\second_level\Motor_0_womany'};
        
 subs = [104, 105, 110, 113,  115, 116, 119, 204, 209, 214, 215,221, 222];       
for g = 1:size(subs,2)  
scans_1 {g,1} = strcat(filename, num2str(subs(g)), '/ModelMotorMoveSimple/con_0002.nii,1'); %

end


for crun = 1:nrun
    inputs{1, crun} = designdirectory; % Factorial design specification: Directory - cfg_files
    inputs{2, crun} = scans_1; % Factorial design specification: Scans - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
