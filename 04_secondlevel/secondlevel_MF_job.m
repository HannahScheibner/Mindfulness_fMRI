%-----------------------------------------------------------------------
% Job saved on 11-May-2015 16:32:09 by cfg_util (rev $Rev: 6134 $)
% spm SPM - SPM12 (6225)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
subs      = [100, 103, 105,  110, 112:116, 119, 201, 204, 208, 209, 211, 214:215,220:222];


matlabbatch{1}.spm.stats.factorial_design.dir = {'/home/hannah/Dokumente/MF_MRTStudie/01_Daten/second_level'};
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).name = 'Stimulus';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).levels = 2;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).name = 'StateofMind';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).levels = 2;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).ancova = 0;

for g = 1:size(subs,2)  
scans_1_1 {g,1} = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/', num2str(subs(g)), '/MF_alltrials/con_0008.nii,1'); %Atem achtsam
scans_1_2 {g,1} = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/', num2str(subs(g)), '/MF_alltrials/con_0007.nii,1'); %Ton achtsam
scans_2_1 {g,1} = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/', num2str(subs(g)), '/MF_alltrials/con_0006.nii,1'); %Atem abgelenkt
scans_2_2 {g,1} = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/', num2str(subs(g)), '/MF_alltrials/con_0005.nii,1'); %Ton abgelenkt

end

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).levels = [1
                                                                    1];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).scans = scans_1_1;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).levels = [1
                                                                    2];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).scans = scans_1_2;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).levels = [2
                                                                    1];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).scans = scans_2_1;
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).levels = [2
                                                                    2];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).scans = scans_2_2;
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.contrasts = 1;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
