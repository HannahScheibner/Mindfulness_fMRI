%-----------------------------------------------------------------------
% Job saved on 04-Jun-2015 17:00:55 by cfg_util (rev $Rev: 6134 $)
% spm SPM - SPM12 (6225)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

subs      = [100, 103, 104, 105,  110, 112:116, 119, 201, 203, 204,  208, 209, 211, 214:215,221,222];

computer = 3; % 1 = ubuntu, 2 = mac, 3 = windows

    if computer ==1 %ubuntu
        filename = '/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/';
    elseif computer ==2 %mac
        filename = '/Volumes/INTENSO/MF_MRTStudie/01_Daten/Probanden/';
    elseif computer ==3 %windows
        filename = 'F:\MF_MRTStudie\01_Daten\Probanden\';
        designdirectory = {'F:\MF_MRTStudie\01_Daten\Model3_1'};
    end
    
for g = 1:size(subs,2)  
scans_1 {g,1} = strcat(filename, num2str(subs(g)), '/Model3_1/con_0005.nii,1'); %Atem achtsam
scans_2 {g,1} = strcat(filename, num2str(subs(g)), '/Model3_1/con_0004.nii,1'); %Ton achtsam
scans_3 {g,1} = strcat(filename, num2str(subs(g)), '/Model3_1/con_0003.nii,1'); %Atem abgelenkt
scans_4 {g,1} = strcat(filename, num2str(subs(g)), '/Model3_1/con_0002.nii,1'); %Ton abgelenkt
scans_5 {g,1} = strcat(filename, num2str(subs(g)), '/Model3_1/con_0006.nii,1'); %Response
end

matlabbatch{1}.spm.stats.factorial_design.dir = designdirectory;
matlabbatch{1}.spm.stats.factorial_design.des.anova.icell(1).scans = scans_1;
matlabbatch{1}.spm.stats.factorial_design.des.anova.icell(2).scans = scans_2;
matlabbatch{1}.spm.stats.factorial_design.des.anova.icell(3).scans = scans_3;
matlabbatch{1}.spm.stats.factorial_design.des.anova.icell(4).scans = scans_4;
matlabbatch{1}.spm.stats.factorial_design.des.anova.icell(5).scans = scans_5;
matlabbatch{1}.spm.stats.factorial_design.des.anova.dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.anova.variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.anova.gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.anova.ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
