%-----------------------------------------------------------------------
% Job saved on 20-Apr-2015 17:22:00 by cfg_util (rev $Rev: 6134 $)
% spm SPM - SPM12 (6225)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.cfg_basicio.file_dir.dir_ops.cfg_cd.dir = '<UNDEFINED>';
matlabbatch{2}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.parent = '<UNDEFINED>';
matlabbatch{2}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.name = '<UNDEFINED>';
matlabbatch{3}.spm.spatial.realign.estimate.data = {
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    '<UNDEFINED>'
                                                    }';
matlabbatch{3}.spm.spatial.realign.estimate.eoptions.quality = 0.9;
matlabbatch{3}.spm.spatial.realign.estimate.eoptions.sep = 4;
matlabbatch{3}.spm.spatial.realign.estimate.eoptions.fwhm = 5;
matlabbatch{3}.spm.spatial.realign.estimate.eoptions.rtm = 1;
matlabbatch{3}.spm.spatial.realign.estimate.eoptions.interp = 2;
matlabbatch{3}.spm.spatial.realign.estimate.eoptions.wrap = [0 0 0];
matlabbatch{3}.spm.spatial.realign.estimate.eoptions.weight = '';
matlabbatch{4}.spm.spatial.realign.write.data(1) = cfg_dep('Realign: Estimate: Realigned Images (Sess 1)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','cfiles'));
matlabbatch{4}.spm.spatial.realign.write.data(2) = cfg_dep('Realign: Estimate: Realigned Images (Sess 2)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{2}, '.','cfiles'));
matlabbatch{4}.spm.spatial.realign.write.data(3) = cfg_dep('Realign: Estimate: Realigned Images (Sess 3)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{3}, '.','cfiles'));
matlabbatch{4}.spm.spatial.realign.write.data(4) = cfg_dep('Realign: Estimate: Realigned Images (Sess 4)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{4}, '.','cfiles'));
matlabbatch{4}.spm.spatial.realign.write.roptions.which = [2 1];
matlabbatch{4}.spm.spatial.realign.write.roptions.interp = 4;
matlabbatch{4}.spm.spatial.realign.write.roptions.wrap = [0 0 0];
matlabbatch{4}.spm.spatial.realign.write.roptions.mask = 1;
matlabbatch{4}.spm.spatial.realign.write.roptions.prefix = 'r';
