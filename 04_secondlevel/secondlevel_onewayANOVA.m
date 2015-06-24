% List of open inputs
% Factorial design specification: Directory - cfg_files
% Factorial design specification: Scans - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'C:\Users\scheibha\Documents\Mindfulness_fMRI\04_secondlevel\secondlevel_onewayANOVA_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(2, nrun);

subs = [100,  103, 104, 105, 110, 112, 113, 114, 115, 116, 119, 201, 203, 204, 208, 209, 211, 214, 215,221];

computer = 3; % 1 = ubuntu, 2 = mac, 3 = windows

    if computer ==1 %ubuntu
        filename = '/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/';
    elseif computer ==2 %mac
        filename = '/Volumes/INTENSO/MF_MRTStudie/01_Daten/Probanden/';
    elseif computer ==3 %windows
        filename = 'F:\MF_MRTStudie\01_Daten\Probanden\';
        designdirectory = {'F:\MF_MRTStudie\01_Daten\second_level\Motor_2_25'};
    end


for g = 1:size(subs,2)  
scans_1 {g,1} = strcat(filename, num2str(subs(g)), '/ModelMotor_2_25/con_0002.nii,1'); %

end

for crun = 1:nrun
    inputs{1, crun} = designdirectory; % Factorial design specification: Directory - cfg_files
    inputs{2, crun} = scans_1; % Factorial design specification: Scans - cfg_files
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
