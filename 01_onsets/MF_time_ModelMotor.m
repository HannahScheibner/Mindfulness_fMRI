

function [names, onsets_thought, durations] = MF_time_ModelMotor(prefix, name)

computer = 3; % 1 = ubuntu, 2 = mac, 3 = windows

    if computer ==1 %ubuntu
        subj_dir = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/', prefix, '/');
        filename = strcat(subj_dir, 'log/' ,prefix, name);  
    elseif computer ==2 %mac
        subj_dir = strcat('/Volumes/INTENSO/MF_MRTStudie/01_Daten/Probanden/', prefix, '/');
        filename = strcat(subj_dir, 'log/' ,prefix, name);  
    elseif computer ==3 %windows
        subj_dir = strcat('F:\MF_MRTStudie\01_Daten\Probanden\', prefix, '\');
        filename = strcat(subj_dir, 'log\' ,prefix, name); %windows
    end



%[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
% 
% [subj, ftrial, fevent, ftype, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
% 
% subj_dir
% filename
% ftrial{5}
% %%% funktioniert!
%% ftime_start finden


dummy = 0;
j = 0;
while dummy<7
        j = j+1;
        if strcmp(fevent{j},'Pulse') == 1
            dummy = dummy + 1;
            if dummy == 6
               ftime_start = str2num(ftime{j});
            end;
        end;
end;
% 
 i = 0;
% if mod (str2num(prefix),2)==0
%     order = 2;
% else
%     order = 1;
% end;


conditions = {'Links' 'Rechts'};
% extras = {'response' 'shift' 'focus' 'nointerest'};
onsets_Motor = cell(numel(conditions),1);
% onsets_response = cell(1,1);
%onsets_shift = cell(1,1);
%onsets_focus = cell(1,1);
%onsets_nointerest=cell(1,1);
% size_NI=0;

% durations_response = cell(1,1);
% durations_nointerest=cell(1,1);



for j= 1:length(fcode)
    if strcmp(fevent{j}, 'Response') ==1
        i = i+ 1;
        if strcmp (fcode{j}, '1') ==1
            event_types(i)=1;
        elseif strcmp (fcode{j}, '2') ==1
            event_types(i)=2;
        end
        event_time(i) = (str2num(ftime{j})-ftime_start)/10000;
        onsets_Motor{event_types(i)} = [onsets_Motor{event_types(i)} (event_time(i))];
    end
%     if strcmp(fcode{j}, 'Interruption_Atem')==1 ||  strcmp(fcode{j}, 'Interruption_Ton')==1
%         l = 0;
%         m = j;
%         trialnum = str2num(ftrial{j});
%         while l == 0
%             m= m+1; 
%             if strcmp(fevent{m}, 'Response') ==1
%                    if strcmp (fcode{m}, '1') ==1
%                         i = i + 1;
%                         if order == 1;
%                             event_types(i)=1;
%                         elseif order == 2;
%                             event_types(i) = 2;
%                         end;
%                     elseif strcmp (fcode{m}, '2') ==1
%                         i = i + 1;
%                         if order == 1;
%                            event_types(i)=2;
%                         elseif order == 2;
%                            event_types(i) = 1;
%                         end;                     
%                      end;
%                      event_time(i) = (str2num(ftime{j})-ftime_start)/10000;
%                      onsets_thought{event_types(i)} = [onsets_thought{event_types(i)} (event_time(i)-10)]; %onset minus 10 sec
%                      l = 1;
%             end;
%             if strcmp(fcode{m}, 'Interruption_Atem')==1 ||  strcmp(fcode{m}, 'Interruption_Ton')==1 ||  strcmp(fcode{m}, 'Ende')==1 
%                 i = i+1;
%                 event_types(i)=2;
%                 event_time(i) = (str2num(ftime{j})-ftime_start)/10000;
%                 onsets_thought{event_types(i)} = [onsets_thought{event_types(i)} (event_time(i)-10)]; 
%                l=1;
%              end;
%                 
%           end;
%      end;
%      if  strcmp(fcode{j}, 'Ende')==1 && size_NI < i
%         end_time(i) = (str2num(ftime{j})-ftime_start)/10000;
%         durations_nointerest{1} = [durations_nointerest{1} (end_time(i)- n(i-1))];
%      end;  
end;                          
   


% dieselbe Info in einem anderen Format
%achtsam = onsets{1,1};
%if size(achtsam)~=[0,0]
 %   achtsam2(:,1) = achtsam(1,:);
  %  onsets2{1,1} = achtsam2;
%else
 %   onsets2{1,1}=[];
%end;
%abgelenkt = onsets{2,1};
%if size(abgelenkt)~=[0,0]
 %   abgelenkt2(:,1) = abgelenkt(1,:);
  %  onsets2{1,2} = abgelenkt2;
%else
 %   onsets2{1,2}=[];
%end;




names = (conditions)';
for l=1:length(onsets_Motor)
    durations_Motor{l}=onsets_Motor{l}*0;
end

% for l = 1:length(onsets_shift)
%     durations_shift{l}= onsets_shift{l}*0+3;
%     durations_focus{l}= onsets_focus{l}*0+3;
% end

durations_Motor = (durations_Motor)';
% durations_shift = (durations_shift)';
% durations_focus=(durations_focus)';






cd(subj_dir);
cd('onsets');
save(strcat(prefix,name,'_time_ModelMotor.mat'), 'names', 'onsets_Motor',  'durations_Motor');
if computer ==1
    cd ('/home/hannah/Mindfulness_fMRI/01_onsets');
elseif computer ==2
    cd('/Volumes/INTENSO/MF_MRTStudie/03_Auswertung');
elseif computer ==3 %windows
    cd('C:\Users\scheibha\Documents\Mindfulness_fMRI\01_onsets');
end
end


    
    
    
