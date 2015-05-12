function preprocess_all_emorec_short

% subs      = [1,2,6,7,9,10,11,14,15,16,17,18,19,21,22,24,27,28,30,31,33,34,...
%      35,36,39,40,41,42,43,46,47,48,49,50,53,54,56,57,58,60,61,62,63,65,68,70,71];

%subs      = [72];  %75!!!
subs = [74];
%subs      = [100,101,102,105,107,108,110,111,113,120,121,124,125,126];
task = '\EmoRec\'


%  if isunix
%   base     = '/projects/onda/firstlevel';
%  else
%   base     = 'F:\UBICA\Imaging\firstlevel';
%  end;
base = 'F:\UBICA\Imaging\firstlevel\';


% save_dir = 'F:\UBICA\EmoRec\Onsets\';
% target_prefix=strcat(save_dir, 'sub_', num2str(sub));




for g = 1:size(subs,2)
    for sess = 1:2
        clear matlabbatch;
        clear s1 s1_new s2_new s1_new_new s2_new_new allfilesnew Mean_new;
        
        %name = sprintf('sub%02.2d',subs(g));         %sub  %age
        name = strcat(base, 'sub02', num2str(subs(g)),task, 'session', num2str(sess));
        % specify data: matrix of filenames and TR
        %===========================================================================
        Dir1               = name;  % pain  %money
        %  Dir1               = [base filesep name filesep 'reward_task'];
        Filter             = '^02_0.*\.img$';
        s1                 = char(select_scans(Filter, Dir1));
        %s2                 = char(select_scans(Filter, Dir2));
        
        % Mean               = cellstr(s1(1,:));
      
           
        %-----------------------------------------------------------------------
        % Job configuration created by cfg_util (rev $Rev: 2787 $)
        %-----------------------------------------------------------------------
        
        % slicetiming
        
        
%         matlabbatch{1}.spm.temporal.st.scans{1} = cellstr(s1);
%         matlabbatch{1}.spm.temporal.st.scans{2} = cellstr(s2);
%         
%         matlabbatch{1}.spm.temporal.st.nslices = 38;
%         matlabbatch{1}.spm.temporal.st.tr = 2.26;
%         matlabbatch{1}.spm.temporal.st.ta = 2.20;
%         matlabbatch{1}.spm.temporal.st.so = [38:-1:1];
%         matlabbatch{1}.spm.temporal.st.refslice = 19;
%         matlabbatch{1}.spm.temporal.st.prefix = 'a';
        
        
        %realign
        
        matlabbatch{1}.spm.spatial.realign.estimate.data{1} = cellstr(s1);
        
        
        matlabbatch{1}.spm.spatial.realign.estimate.eoptions.quality = 0.9;
        matlabbatch{1}.spm.spatial.realign.estimate.eoptions.sep     = 4;
        matlabbatch{1}.spm.spatial.realign.estimate.eoptions.fwhm    = 5;
        matlabbatch{1}.spm.spatial.realign.estimate.eoptions.rtm   = 1;
        matlabbatch{1}.spm.spatial.realign.estimate.eoptions.interp  = 2;
        matlabbatch{1}.spm.spatial.realign.estimate.eoptions.wrap    = [0 0 0];
        matlabbatch{1}.spm.spatial.realign.estimate.eoptions.weight  = {};
        
        
        % normalise
        
        matlabbatch{2}.spm.spatial.normalise.estwrite.subj.source    = cellstr(s1(1,:));
        matlabbatch{2}.spm.spatial.normalise.estwrite.subj.wtsrc     = {};
        matlabbatch{2}.spm.spatial.normalise.estwrite.subj.resample  = cellstr(s1);
        
        matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.template={'C:\Programme\SPM\spm8\templates\EPI.nii,1'};
        
        
        matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.weight   = {''};
        matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.smosrc   = 8;
        matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.smoref   = 0;
        matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.regtype  = 'mni';
        matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.cutoff   = 25;
        matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.nits     = 16;
        matlabbatch{2}.spm.spatial.normalise.estwrite.eoptions.reg      = 1;
        
        
        matlabbatch{2}.spm.spatial.normalise.estwrite.roptions.preserve = 0;
        matlabbatch{2}.spm.spatial.normalise.estwrite.roptions.bb       = [-78 -112 -50 ;78 76 85];
        matlabbatch{2}.spm.spatial.normalise.estwrite.roptions.vox      = [2 2 2];
        matlabbatch{2}.spm.spatial.normalise.estwrite.roptions.interp   = 1;
        matlabbatch{2}.spm.spatial.normalise.estwrite.roptions.wrap     = [0 0 0];
        
        % smoothing
        
        allfiles = s1;
        for zz = 1:size(allfiles,1)
            allfilesnew(zz,:) = strrep(allfiles(zz,:),'02_0','w02_0');
        end;
        
       
        matlabbatch{3}.spm.spatial.smooth.data =cellstr(allfilesnew);
        matlabbatch{3}.spm.spatial.smooth.fwhm = [8 8 8];
        matlabbatch{3}.spm.spatial.smooth.dtype = 0;
        matlabbatch{3}.spm.spatial.smooth.prefix = 's8_';
        
        
        
        
        
        
        save([name '_preprocess_all_emorec_short'],'matlabbatch');
        spm_jobman('run',matlabbatch);
        
        
        
        
%         delete([Dir1 '/a*.nii']);
%         delete([Dir1 '/ua*.nii']);
%         delete([Dir1 '/w02*.img']);
%         delete([Dir1 '/w02*.hdr']);
%         delete([Dir1 '/s8_02*.img']);
%         delete([Dir1 '/s8_02*.hdr']);
        % Dir2
        
        %  delete([Dir2 '/a*.nii']);
        % delete([Dir2 '/ua*.nii']);
        % delete([Dir2 '/wua*.nii']);
        
        
        % Specify job.mat
        %===========================================================================
        
    end;
   
end;




% -------------------------------
% subfunction for selecting scans
% -------------------------------
function [files] = select_scans(file_filt, direc)

x     = []; x     = spm_select('List', direc, file_filt);
y     = []; y     = [repmat([direc filesep], size(x, 1), 1) x repmat(',1', size(x, 1), 1)];
files = []; files = mat2cell(y, ones(size(y, 1), 1), size(y, 2));


