function firstlevel_MF_Model4(ids)

% --------
% Subjects
% --------
% subs      = [7,11,17,18,19,31,33,49,53,55,58,59,61,65,68,70,74, .... 
%              78, 91, 95, 101, 108, 111, 124];
subs = [100,  103, 104, 105, 110, 112:116, 119, 201, 203, 204, 208, 209, 211, 214:215,220:222];
subs      = subs(ids);

%108 and 206, 207, 212 had to be excluded because it didn't have and mind wandering in
%session 3
%subs      = [101,102,107,108,110,111,113,120,121,124,126];
%subs = 1;

%max_subs          = 90;   %subjects(end);
%exclude           = [];  %!!!                                              % ENTER: Which subjects to exclude from current run
%subjects(exclude) = [];
computer = 3; % 1 = ubuntu, 2 = mac, 3 = windows

    if computer == 1 %ubuntu
        task              = 'NIFTI/MF'; 
        analysis_name     = 'Model3';
        base              = '/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden';
        dir_logfiles      = '/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden'; 
        dir_analysis = '/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden';

    elseif computer == 2 %mac
       task              = 'NIFTI/Vorverarbeitung';
       analysis_name     = 'Model3';
       base = '/Volumes/INTENSO/MF_MRTStudie/01_Daten/Probanden';
       dir_logfiles = '/Volumes/INTENSO/MF_MRTStudie/01_Daten/Probanden';
       dir_analysis = '/Volumes/INTENSO/MF_MRTStudie/01_Daten/Probanden';
    elseif computer == 3 %windows
       analysis_name     = 'Model4_test';
       base = 'F:\MF_MRTStudie\01_Daten\Probanden';
       dir_logfiles = 'F:\MF_MRTStudie\01_Daten\Probanden';
       dir_analysis = 'F:\MF_MRTStudie\01_Daten\Probanden';      
end


% ------------
% Directories
% ------------
dir_starting      = pwd;                                                    % pwd=current folder

% -----
% flags
% -----
specify   = 1;                                                             % ENTER: 0-No/1-Yes
estimate  = 1; %!!!                                                        % ENTER: 0-No/1-Yes
inference = 0; %!!!                                                        % ENTER: 0-No/1-Yes



%------
% names for onset files
%----

onset1_1 = '-01_fMRT_mindfulness_internal_15_sce.log_time_Model3_1.mat';
onset1_2 = '-01_fMRT_mindfulness_external_15_sce.log_time_Model3_1.mat';
onset2_1 = '-02_fMRT_mindfulness_external_15_sce.log_time_Model3_1.mat';
onset2_2 = '-02_fMRT_mindfulness_internal_15_sce.log_time_Model3_1.mat';
onset3_1 = '-03_fMRT_mindfulness_internal_7.log_time_Model3_1.mat';
onset3_2 = '-03_fMRT_mindfulness_external_7.log_time_Model3_1.mat';
onset4_1 = '-04_fMRT_mindfulness_external_7.log_time_Model3_1.mat';
onset4_2 = '-04_fMRT_mindfulness_internal_7.log_time_Model3_1.mat';




% ------------------
% loop over subjects
% ------------------
for g = 1:size(subs,2)
    
    z = 0;
    
    clear matlabbatch;
    clear SPM;
    
    name = strcat(num2str(subs(g)));
    
    if isdir([dir_analysis filesep name filesep analysis_name filesep])
        cd([dir_analysis filesep name filesep analysis_name filesep])
        %delete SPM.mat
        
    end
    
   
    % ---- make analysis directory -----------------
    mkdir([dir_analysis filesep name filesep analysis_name]);
    cd([dir_analysis filesep name filesep analysis_name]);
    
    
    % -------
    % specify
    % -------
    if specify
        
        z = z+1;
        
        matlabbatch{z}.spm.stats.fmri_spec.timing.units           = 'secs';
        matlabbatch{z}.spm.stats.fmri_spec.timing.RT              = 2
        matlabbatch{z}.spm.stats.fmri_spec.timing.fmri_t          = 16;
        matlabbatch{z}.spm.stats.fmri_spec.timing.fmri_t0         = 8;
        
        %---- load onsets for each session ------
        
        for s = 1:4 % sessions = 4
            if subs(g) <200
                if s == 1 
%                     sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset1_1])
                    task = 'NIFTI\MF_Task_0005';
                    sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset1_1])
                    rp = dir(strcat(base , filesep , num2str(subs(g)), filesep, task, filesep,'*rp*.txt'));
                elseif s==2
%                  sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset2_1]);
                 sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset2_1]);
                    task = 'NIFTI\MF_Task_0006';
                    rp = dir(strcat(base , filesep , num2str(subs(g)), filesep, task, filesep,'*rp*.txt'));
                elseif s==3
                     task = 'NIFTI\MF_Task_0007';
%                  sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset3_1]);
                 sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset3_1]); 
                 rp = dir(strcat(base , filesep , num2str(subs(g)), filesep, task, filesep,'*rp*.txt'));
                elseif s==4
                    task = 'NIFTI\MF_Task_0008';
%                  sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset4_1]);    
                 sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset4_1]); 
                 rp = dir(strcat(base , filesep , num2str(subs(g)), filesep, task, filesep,'*rp*.txt'));
                end
            else
                 if s == 1 
                     task = 'NIFTI\MF_Task_0005';
%                     sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset1_2]);
                    sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset1_2]);
                    rp = dir(strcat(base , filesep , num2str(subs(g)), filesep, task, filesep,'*rp*.txt'));
                elseif s==2
                    task = 'NIFTI\MF_Task_0006';
%                  sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset2_2]);
                 sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset2_2]);
                 rp = dir(strcat(base , filesep , num2str(subs(g)), filesep, task, filesep,'*rp*.txt'));
                elseif s==3
                    task = 'NIFTI\MF_Task_0007';
%                  sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset3_2]);
                 sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset3_2]);
                 rp = dir(strcat(base , filesep , num2str(subs(g)), filesep, task, filesep,'*rp*.txt'));
                elseif s==4
                    task = 'NIFTI\MF_Task_0008';
%                  sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset4_2]);
                 sess_onsets = load([base filesep num2str(subs(g)) filesep 'onsets' filesep num2str(subs(g)) onset4_2]);
                 rp = dir(strcat(base , filesep , num2str(subs(g)), filesep, task, filesep,'*rp*.txt'));
                 end
            end
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).scans             = select_scans('^s8.*',[base filesep num2str(subs(g)) filesep task filesep num2str(s)]) %kann je nach smoothing ge�ndert werden
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).scans             = select_scans('^s8.*',[base filesep num2str(subs(g)) filesep task]);
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(1).name      = sess_onsets.names{1,1}; %achtsam
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(1).onset     = sess_onsets.onsets_thought{1,1};
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(1).duration  = sess_onsets.durations_thought{1,1};
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(1).tmod      = 0
            
            %         matlabbatch{z}.spm.stats.fmri_spec.sess.cond(1).pmod.name  = 'CS_NE_M Prediction';
            %         matlabbatch{z}.spm.stats.fmri_spec.sess.cond(1).pmod.param = [V(find(u(:,3)==1),3) - mean(V(find(u(:,3)==1),3))];
            %         matlabbatch{z}.spm.stats.fmri_spec.sess.cond(1).pmod.poly  = 1;
            
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(2).name      = sess_onsets.names{2,1}; %abgelenkt
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(2).onset     = sess_onsets.onsets_thought{2,1};
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(2).duration  = sess_onsets.durations_thought{2,1};
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(2).tmod      = 0
            
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(3).name      = sess_onsets.names_extras{1,1}; %response
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(3).onset     = sess_onsets.onsets_response{1,1};
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(3).duration  = sess_onsets.durations_response{1,1};
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(3).tmod      = 0
            
            
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(4).name      = sess_onsets.names_extras{2,1}; %shift
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(4).onset     = sess_onsets.onsets_shift{1,1};
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(4).duration  = sess_onsets.durations_shift{1,1};
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(4).tmod      = 0
%             
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(5).name      = sess_onsets.names_extras{3,1}; %focus
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(5).onset     = sess_onsets.onsets_focus{1,1};
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(5).duration  = sess_onsets.durations_focus{1,1};
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(5).tmod      = 0
            
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(4).name      = sess_onsets.names_extras{4,1}; %no_interest
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(4).onset     = sess_onsets.onsets_nointerest{1,1};
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(4).duration  = sess_onsets.durations_nointerest{1,1};
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).cond(4).tmod      = 0
%             
%             matlabbatch{z}.spm.stats.fmri_spec.sess(s).multi             = rp;
            %matlabbatch{z}.spm.stats.fmri_spec.sess(s).regress.name      = ;
            %matlabbatch{z}.spm.stats.fmri_spec.sess(s).regress.val       = ;
            
            
%             matlabbatch{z}.spm.stats.fmri_spec.sess.multi = {''};
%             matlabbatch{z}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
            matlabbatch{z}.spm.stats.fmri_spec.sess(s).multi_reg = {strcat(dir_analysis , filesep ,num2str(subs(g)) ,filesep ,task, filesep, rp.name)};
%             matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
            
            
            
%             matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {'F:\MF_MRTStudie\01_Daten\Probanden\100\NIFTI\MF_Task_0005\rp_fMF_w_HC_100-152603-00006-00006-1.txt'};
             matlabbatch{z}.spm.stats.fmri_spec.sess(s).hpf               = 128;
        end
        
                
        %matlabbatch{z}.spm.stats.fmri_spec.fact.name              = ;
        %matlabbatch{z}.spm.stats.fmri_spec.fact.levels            = ;
%         matlabbatch{z}.spm.stats.fmri_spec.bases.hrf.derivs       = [0 0];
        matlabbatch{z}.spm.stats.fmri_spec.bases.fir.length = 10;
        matlabbatch{z}.spm.stats.fmri_spec.bases.fir.order = 5;
        matlabbatch{z}.spm.stats.fmri_spec.volt                   = 1;
        matlabbatch{z}.spm.stats.fmri_spec.dir                    = {[dir_analysis filesep name filesep analysis_name]};
        matlabbatch{z}.spm.stats.fmri_spec.global                 = 'None';
        %matlabbatch{z}.spm.stats.fmri_spec.mask                   = {'/projects/fear/new_study/fmri/brainmask_cut.img'};
        matlabbatch{z}.spm.stats.fmri_spec.mask                   = {''}
        matlabbatch{z}.spm.stats.fmri_spec.cvi                    = 'AR(1)';
        
  
    end
    
    
    % --------
    % estimate
    % --------
    
        if estimate
    
            z = z+1;
    
            matlabbatch{z}.spm.stats.fmri_est.spmmat           = {[dir_analysis filesep name filesep analysis_name filesep 'SPM.mat']};
            matlabbatch{z}.spm.stats.fmri_est.method.Classical = 1;
    
        end
    
    
    % ---------
    % inference
    % ---------
        if inference
    
            z = z+1;
    
            matlabbatch{z}.spm.stats.con.spmmat                  = {[dir_analysis filesep name filesep analysis_name filesep num2str(subs(g)) '_firstlevel.mat']};
    
    
            matlabbatch{z}.spm.stats.con.consess{1}.fcon.name    = 'effects of interest';
            matlabbatch{z}.spm.stats.con.consess{1}.fcon.convec  = {[eye(12) zeros(12,1)]}; %% 12 = es gibt 3 Moglichkeiten fuer 4 sessions
            
%             matlabbatch{z}.spm.stats.con.consess{2}.tcon.name    = 'achtsam';
%             matlabbatch{z}.spm.stats.con.consess{2}.tcon.convec  = [1 0 1 0 1 0 1 0];
%     
%             matlabbatch{z}.spm.stats.con.consess{3}.tcon.name    = 'abgelenkt';
%             matlabbatch{z}.spm.stats.con.consess{3}.tcon.convec  = [0 1 0 1 0 1 0 1];
%             
%             
%             matlabbatch{z}.spm.stats.con.consess{4}.tcon.name    = 'achtsam-abgelenkt';
%             matlabbatch{z}.spm.stats.con.consess{4}.tcon.convec  = [1 -1 1 -1 1 -1 1 -1]; 
            
            
            if subs(g) > 200
            
            matlabbatch{z}.spm.stats.con.consess{2}.tcon.name    = 'abgelenktTon';
            matlabbatch{z}.spm.stats.con.consess{2}.tcon.convec  = [0 1 0 0 0 0 0 1 0 0 0 0];
            
            matlabbatch{z}.spm.stats.con.consess{3}.tcon.name    = 'abgelenktAtem';
            matlabbatch{z}.spm.stats.con.consess{3}.tcon.convec  = [0 0 0 0 1 0 0 0 0 0 1 0];
            
            matlabbatch{z}.spm.stats.con.consess{4}.tcon.name    = 'achtsamTon';
            matlabbatch{z}.spm.stats.con.consess{4}.tcon.convec  = [1 0 0 0 0 0 1 0 0 0 0 0];
            
            matlabbatch{z}.spm.stats.con.consess{5}.tcon.name    = 'achtsamAtem';
            matlabbatch{z}.spm.stats.con.consess{5}.tcon.convec  = [0 0 0 1 0 0 0 0 0 1 0 0];

            else
            matlabbatch{z}.spm.stats.con.consess{2}.tcon.name    = 'abgelenktTon';
            matlabbatch{z}.spm.stats.con.consess{2}.tcon.convec  = [0 0 0 0 1 0 0 0 0 0 1 0];
            
            matlabbatch{z}.spm.stats.con.consess{3}.tcon.name    = 'abgelenktAtem';
            matlabbatch{z}.spm.stats.con.consess{3}.tcon.convec  = [0 1 0 0 0 0 0 1 0 0 0 0];
            
            matlabbatch{z}.spm.stats.con.consess{4}.tcon.name    = 'achtsamTon';
            matlabbatch{z}.spm.stats.con.consess{4}.tcon.convec  = [0 0 0 1 0 0 0 0 0 1 0 0];
            
            matlabbatch{z}.spm.stats.con.consess{5}.tcon.name    = 'achtsamAtem';
            matlabbatch{z}.spm.stats.con.consess{5}.tcon.convec  = [1 0 0 0 0 0 1 0 0 0 0 0];
            end
            matlabbatch{z}.spm.stats.con.consess{6}.tcon.name    = 'Response';
            matlabbatch{z}.spm.stats.con.consess{6}.tcon.convec  = [0 0 1 0 0 1 0 0 1 0 0 1];
%             matlabbatch{z}.spm.stats.con.consess{7}.tcon.name    = 'NoInterest';
%             matlabbatch{z}.spm.stats.con.consess{7}.tcon.convec  = [0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 ];

        end
    
    
    % -------------------
    % run job
    % -------------------
    save([name '_firstlevel'],'matlabbatch');
    spm_jobman('run',matlabbatch);
    
    %
    if computer ==1
        cd ('/home/hannah/Mindfulness_fMRI/03_firstlevel');
    elseif computer ==2
        cd('/Volumes/INTENSO/MF_MRTStudie/03_Auswertung');
    elseif computer ==3
        cd('C:\Users\scheibha\Documents\Mindfulness_fMRI\03_firstlevel');
    end
end

%
%     for g = 1:size(subjects,2)
%         name = zero_pad(max_subs, subjects(g));
%         cd([dir_analysis filesep name filesep analysis_name]);
%         delete *.*;
%         cd ..;
%         rmdir([dir_analysis filesep name filesep analysis_name]);
%     end

% close all;
%
% cd(dir_starting);


% ----------------------------
% subfunction for zero padding
% ----------------------------
function [padded] = zero_pad(a, b)

padded = []; padded = sprintf('%0*d', floor(log10(a))+1, b);


% -------------------------------
% subfunction for selecting scans
% -------------------------------
function [files] = select_scans(file_filt, direc)

x     = []; x     = spm_select('List', direc, file_filt);
y     = []; y     = [repmat([direc filesep], size(x, 1), 1) x repmat(',1', size(x, 1), 1)];
files = []; files = mat2cell(y, ones(size(y, 1), 1), size(y, 2));