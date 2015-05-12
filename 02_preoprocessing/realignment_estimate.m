% List of open inputs
% Change Directory: Directory - cfg_files
% Make Directory: Parent Directory - cfg_files
% Make Directory: New Directory Name - cfg_entry
% Realign: Estimate: Session - cfg_files
% Realign: Estimate: Session - cfg_files
% Realign: Estimate: Session - cfg_files
% Realign: Estimate: Session - cfg_files
nrun = 1; % enter the number of runs here
jobfile = {'/home/hannah/Dokumente/MF_MRTStudie/03_Achtsamkeit_Auswertung/realignment_estimate2_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(7, nrun);
for i = 100:222
    if any(i == [105, 108, 110, 112,113,115,116, 119, 204, 206, 207, 209, 211:212, 214:215,220:222])
        direct = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeitsstudie_MRT_Daten/Probanden/', num2str(i), '/NIFTI/');
        [files1, dirs] = spm_select('ExtList', strcat(direct, 'MF_Task_0005'), '.*', Inf)
        [files2, dirs] = spm_select('ExtList', strcat(direct, 'MF_Task_0006'), '.*', Inf)
        [files3, dirs] = spm_select('ExtList', strcat(direct, 'MF_Task_0007'), '.*', Inf)
        [files4, dirs] = spm_select('ExtList', strcat(direct, 'MF_Task_0008'), '.*', Inf)
        
        for crun = 1:nrun
        inputs{1, crun} = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeitsstudie_MRT_Daten/Probanden/', num2str(i), '/'); % Change Directory: Directory - cfg_files
        inputs{2, crun} = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeitsstudie_MRT_Daten/Probanden/', num2str(i) , '/'); % Make Directory: Parent Directory - cfg_files
        inputs{3, crun} = 'Realigned'; % Make Directory: New Directory Name - cfg_entry
        inputs{4, crun} = files1; % Realign: Estimate: Session - cfg_files
        inputs{5, crun} = files2; % Realign: Estimate: Session - cfg_files
        inputs{6, crun} = files3; % Realign: Estimate: Session - cfg_files
        inputs{7, crun} = files4; % Realign: Estimate: Session - cfg_files
        spm('defaults', 'FMRI');
        spm_jobman('run', jobs, inputs{:});
        end
    end
end



% exceptions: 100, 103,201,208,114

