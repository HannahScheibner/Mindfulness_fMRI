function smoothonly

% subs      = [1,2,6,7,9,10,11,14,15,16,17,18,19,21,22,24,27,28,30,31,33,34,...
%      35,36,39,40,41,42,43,46,47,48,49,50,53,54,56,57,58,60,61,62,63,65,68,70,71];

%subs      = [72];  %75!!!
subs = [104, 105, 108, 110, 112,113,115,116, 119, 204, 206, 207, 209, 211, 212, 214, 215,220, 221, 222];
%subs      = [100,101,102,105,107,108,110,111,113,120,121,124,125,126];
task = 'NIFTI/MF';


%  if isunix
%   base     = '/projects/onda/firstlevel';
%  else
%   base     = 'F:\UBICA\Imaging\firstlevel';
%  end;
base = '/home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeit_MRT_Daten/Probanden/';


% save_dir = 'F:\UBICA\EmoRec\Onsets\';
% target_prefix=strcat(save_dir, 'sub_', num2str(sub));




for g = 1:20
        for sess = 1:4
            clear matlabbatch;
            clear s1 s1_new s2_new s1_new_new s2_new_new allfilesnew Mean_new;

            %name = sprintf('sub%02.2d',subs(g));         %sub  %age
            %name = strcat(base, 'sub02', num2str(subs(g)),task, 'session', num2str(sess));
            name = strcat(base, num2str(subs(g)), '/', task, '/', num2str(sess)); 

            % specify data: matrix of filenames and TR
            %===========================================================================
            Dir1               = name;  % pain  %money
            cd (Dir1);
            %  Dir1               = [base filesep name filesep 'reward_task'];
            Filter             = '^fMF.*';
            s1                 = char(select_scans(Filter, Dir1));
        % smoothing

            allfiles = s1;
            for zz = 1:size(allfiles,1)
                allfilesnew(zz,:) = strrep(allfiles(zz,:),'fMF','wfMF');
            end;


            matlabbatch{1}.spm.spatial.smooth.data =cellstr(allfilesnew);
            matlabbatch{1}.spm.spatial.smooth.fwhm = [8 8 8];
            matlabbatch{1}.spm.spatial.smooth.dtype = 0;
            matlabbatch{1}.spm.spatial.smooth.prefix = 's8_';






            save([name '_preprocess_all_MF'],'matlabbatch');
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