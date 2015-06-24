%-----------------------------------------------------------------------
% Job saved on 11-May-2015 16:32:09 by cfg_util (rev $Rev: 6134 $)
% spm SPM - SPM12 (6225)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
subs      = [103, 104, 105,  110, 112:116, 119,  203,   209, 211, 214:215,221:222];

computer = 3; % 1 = ubuntu, 2 = mac, 3 = windows

    if computer ==1 %ubuntu
        filename = '/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/';
    elseif computer ==2 %mac
        filename = '/Volumes/INTENSO/MF_MRTStudie/01_Daten/Probanden/';
    elseif computer ==3 %windows
        filename = 'F:\MF_MRTStudie\01_Daten\Probanden\';
        designdirectory = {'F:\MF_MRTStudie\01_Daten\Model5'};
    end
    
matlabbatch{1}.spm.stats.factorial_design.dir = designdirectory;
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
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).name = 'Time';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).levels = 5;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).ancova = 0;



for g = 1:size(subs,2)  
scans_1_1_1 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0002.nii,1'); %Ton achtsam 1
scans_1_1_2 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0003.nii,1'); %Ton achtsam 2
scans_1_1_3 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0004.nii,1'); %Ton achtsam 3
scans_1_1_4 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0005.nii,1'); %Ton achtsam 4
scans_1_1_5 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0006.nii,1'); %Ton achtsam 5
scans_1_2_1 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0007.nii,1'); %Ton abgelenkt 1
scans_1_2_2 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0008.nii,1'); %Ton abgelenkt 2
scans_1_2_3 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0009.nii,1'); %Ton abgelenkt 3
scans_1_2_4 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0010.nii,1'); %Ton abgelenkt 4
scans_1_2_5 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0011.nii,1'); %Ton abgelenkt 5

scans_2_1_1 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0012.nii,1'); %Atem achtsam 1
scans_2_1_2 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0013.nii,1'); %Atem achtsam 2
scans_2_1_3 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0014.nii,1'); %Atem achtsam 3
scans_2_1_4 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0015.nii,1'); %Atem achtsam 4
scans_2_1_5 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0016.nii,1'); %Atem achtsam 5
scans_2_2_1 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0017.nii,1'); %Atem abgelenkt 1
scans_2_2_2 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0018.nii,1'); %Atem abgelenkt 2
scans_2_2_3 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0019.nii,1'); %Atem abgelenkt 3
scans_2_2_4 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0020.nii,1'); %Atem abgelenkt 4
scans_2_2_5 {g,1} = strcat(filename, num2str(subs(g)), '/Model5/con_0021.nii,1'); %Atem abgelenkt 5

end

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).levels = [1
                                                                    1
                                                                    1];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).scans = scans_1_1_1;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).levels = [1
                                                                    1
                                                                    2];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).scans = scans_1_1_2;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).levels = [1
                                                                    1
                                                                    3];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).scans = scans_1_1_3;


%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).levels = [1
                                                                    1
                                                                    4];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).scans = scans_1_1_4;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(5).levels = [1
                                                                    1
                                                                    5];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(5).scans = scans_1_1_5;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(6).levels = [1
                                                                    2
                                                                    1];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(6).scans = scans_1_2_1;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(7).levels = [1
                                                                    2
                                                                    2];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(7).scans = scans_1_2_2;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(8).levels = [1
                                                                    2
                                                                    3];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(8).scans = scans_1_2_3;


%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(9).levels = [1
                                                                    2
                                                                    4];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(9).scans = scans_1_2_4;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(10).levels = [1
                                                                    2
                                                                    5];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(10).scans = scans_1_2_5;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(11).levels = [2
                                                                    1
                                                                    1];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(11).scans = scans_2_1_1;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(12).levels = [2
                                                                    1
                                                                    2];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(12).scans = scans_2_1_2;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(13).levels = [2
                                                                    1
                                                                    3];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(13).scans = scans_2_1_3;


%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(14).levels = [2
                                                                    1
                                                                    4];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(14).scans = scans_2_1_4;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(15).levels = [2
                                                                    1
                                                                    5];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(15).scans = scans_2_1_5;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(16).levels = [2
                                                                    2
                                                                    1];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(16).scans = scans_2_2_1;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(17).levels = [2
                                                                    2
                                                                    2];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(17).scans = scans_2_2_2;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(18).levels = [2
                                                                    2
                                                                    3];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(18).scans = scans_2_2_3;


%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(19).levels = [2
                                                                    2
                                                                    4];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(19).scans = scans_2_2_4;

%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(20).levels = [2
                                                                    2
                                                                    5];
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(20).scans = scans_2_2_5;




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
