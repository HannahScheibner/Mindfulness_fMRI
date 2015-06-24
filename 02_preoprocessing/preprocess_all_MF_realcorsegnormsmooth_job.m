

%-----------------------------------------------------------------------
% Job saved on 22-Jun-2015 17:53:16 by cfg_util (rev $Rev: 6134 $)
% spm SPM - SPM12 (6225)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------



function preprocess_all_MF
subs = [201];
computer = 3;

%  if isunix
%   base     = '/projects/onda/firstlevel';
%  else
%   base     = 'F:\UBICA\Imaging\firstlevel';
%  end;
if computer ==1
    base = '/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/';
elseif computer ==3
    base = 'F:\MF_MRTStudie\01_Daten\Probanden\';
end
    

for g = 1
        for sess = 1:4
            clear matlabbatch;
            clear s1 s1_new s2_new s1_new_new s2_new_new allfilesnew Mean_new;

            %name = sprintf('sub%02.2d',subs(g));         %sub  %age
            %name = strcat(base, 'sub02', num2str(subs(g)),task, 'session', num2str(sess));
            if sess == 1
                task = 'NIFTI\MF_Task_0005';
            elseif sess ==2
                task = 'NIFTI\MF_Task_0006';
            elseif sess ==3
                task = 'NIFTI\MF_Task_0007';
            elseif sess ==4
                task = 'NIFTI\MF_Task_0008';
            end
            name = strcat(base, num2str(subs(g)), '\', task); 

            % specify data: matrix of filenames and TR
            %===========================================================================
            Dir1               = name;  % pain  %money
            cd (Dir1);
             %  Dir1               = [base filesep name filesep 'reward_task'];
             Filter             = '^f.*';
             s1                 = char(select_scans(Filter, Dir1));






matlabbatch{1}.spm.spatial.realign.estwrite.data{1} = cellstr(s1);
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.prefix = 'r';


allfiles = s1;
   for zz = 1:size(allfiles,1)
       allfilesnew(zz,:) = strrep(allfiles(zz,:),'fMF','rfMF');
   end;




matlabbatch{2}.spm.spatial.coreg.estwrite.ref = '<UNDEFINED>';
matlabbatch{2}.spm.spatial.coreg.estwrite.source = '<UNDEFINED>';
matlabbatch{2}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{2}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{2}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{2}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{2}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{2}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{2}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{2}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{2}.spm.spatial.coreg.estwrite.roptions.prefix = 'c';


allfiles = s1;
   for zz = 1:size(allfiles,1)
       allfilesnew(zz,:) = strrep(allfiles(zz,:),'fMF','crfMF');
   end;






matlabbatch{3}.spm.spatial.preproc.channel.vols = '<UNDEFINED>';
matlabbatch{3}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{3}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{3}.spm.spatial.preproc.channel.write = [0 0];
matlabbatch{3}.spm.spatial.preproc.tissue(1).tpm = {'C:\Program Files\MATLAB\R2014b\toolbox\spm12\tpm\TPM.nii,1'};
matlabbatch{3}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{3}.spm.spatial.preproc.tissue(1).native = [1 0];
matlabbatch{3}.spm.spatial.preproc.tissue(1).warped = [0 0];
matlabbatch{3}.spm.spatial.preproc.tissue(2).tpm = {'C:\Program Files\MATLAB\R2014b\toolbox\spm12\tpm\TPM.nii,2'};
matlabbatch{3}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{3}.spm.spatial.preproc.tissue(2).native = [1 0];
matlabbatch{3}.spm.spatial.preproc.tissue(2).warped = [0 0];
matlabbatch{3}.spm.spatial.preproc.tissue(3).tpm = {'C:\Program Files\MATLAB\R2014b\toolbox\spm12\tpm\TPM.nii,3'};
matlabbatch{3}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{3}.spm.spatial.preproc.tissue(3).native = [1 0];
matlabbatch{3}.spm.spatial.preproc.tissue(3).warped = [0 0];
matlabbatch{3}.spm.spatial.preproc.tissue(4).tpm = {'C:\Program Files\MATLAB\R2014b\toolbox\spm12\tpm\TPM.nii,4'};
matlabbatch{3}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{3}.spm.spatial.preproc.tissue(4).native = [1 0];
matlabbatch{3}.spm.spatial.preproc.tissue(4).warped = [0 0];
matlabbatch{3}.spm.spatial.preproc.tissue(5).tpm = {'C:\Program Files\MATLAB\R2014b\toolbox\spm12\tpm\TPM.nii,5'};
matlabbatch{3}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{3}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{3}.spm.spatial.preproc.tissue(5).warped = [0 0];
matlabbatch{3}.spm.spatial.preproc.tissue(6).tpm = {'C:\Program Files\MATLAB\R2014b\toolbox\spm12\tpm\TPM.nii,6'};
matlabbatch{3}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{3}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{3}.spm.spatial.preproc.tissue(6).warped = [0 0];
matlabbatch{3}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{3}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{3}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{3}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{3}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{3}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{3}.spm.spatial.preproc.warp.write = [0 0];





matlabbatch{4}.spm.spatial.normalise.estwrite.subj(1).vol = '<UNDEFINED>';
matlabbatch{4}.spm.spatial.normalise.estwrite.subj(1).resample = '<UNDEFINED>';
matlabbatch{4}.spm.spatial.normalise.estwrite.subj(2).vol = '<UNDEFINED>';
matlabbatch{4}.spm.spatial.normalise.estwrite.subj(2).resample = '<UNDEFINED>';
matlabbatch{4}.spm.spatial.normalise.estwrite.eoptions.biasreg = 0.0001;
matlabbatch{4}.spm.spatial.normalise.estwrite.eoptions.biasfwhm = 60;
matlabbatch{4}.spm.spatial.normalise.estwrite.eoptions.tpm = {'C:\Program Files\MATLAB\R2014b\toolbox\spm12\tpm\TPM.nii'};
matlabbatch{4}.spm.spatial.normalise.estwrite.eoptions.affreg = 'mni';
matlabbatch{4}.spm.spatial.normalise.estwrite.eoptions.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{4}.spm.spatial.normalise.estwrite.eoptions.fwhm = 0;
matlabbatch{4}.spm.spatial.normalise.estwrite.eoptions.samp = 3;
matlabbatch{4}.spm.spatial.normalise.estwrite.woptions.bb = [-78 -112 -70
                                                             78 76 85];
matlabbatch{4}.spm.spatial.normalise.estwrite.woptions.vox = [2 2 2];
matlabbatch{4}.spm.spatial.normalise.estwrite.woptions.interp = 4;




allfiles = s1;
   for zz = 1:size(allfiles,1)
       allfilesnew(zz,:) = strrep(allfiles(zz,:),'fMF','crfMF');
   end;







matlabbatch{5}.spm.spatial.smooth.data = '<UNDEFINED>';
matlabbatch{5}.spm.spatial.smooth.fwhm = [8 8 8];
matlabbatch{5}.spm.spatial.smooth.dtype = 0;
matlabbatch{5}.spm.spatial.smooth.im = 0;
matlabbatch{5}.spm.spatial.smooth.prefix = 's';
