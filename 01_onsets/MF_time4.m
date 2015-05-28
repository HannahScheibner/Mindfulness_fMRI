

function [names, onsets, durations] = MF_time4(prefix, name)

computer = 1; % 1 = ubuntu, 2 = mac, 3 = windows

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

i = 0;
if mod (str2num(prefix),2)==0
    order = 2;
else
    order = 1;
end;

TR = 2000;

conditions = {'achtsam' 'abgelenkt'};
onsets = cell(numel(conditions),1);



for j= 1:length(fcode)
    if strcmp(fcode{j}, 'Interruption_Atem')==1 ||  strcmp(fcode{j}, 'Interruption_Ton')==1
        l = 0;
        m = j;
        trialnum = str2num(ftrial{j});
        while l == 0
            m= m+1; 
            if strcmp(fevent{m}, 'Response') ==1
                   if strcmp (fcode{m}, '1') ==1
                        i = i + 1;
                        if order == 1;
                            event_types(i)=1;
                        elseif order == 2;
                            event_types(i) = 2;
                        end;
                        event_time(i) = round((round((str2num(ftime{j})-ftime_start)/10)/TR)*10)/10;
                    elseif strcmp (fcode{m}, '2') ==1
                        i = i + 1;
                        if order == 1;
                           event_types(i)=2;
                        elseif order == 2;
                           event_types(i) = 1;
                        end;
                        event_time(i) = round((round((str2num(ftime{j})-ftime_start)/10)/TR)*10)/10;
                     end;
                        % save onset times corrected for one DDA
                     onsets{event_types(i)} = [onsets{event_types(i)} (event_time(i)-2)]; %onset minus 2 TR (4sec)
                        %onsets{event_types(i)} = [onsets{event_types(i)} (event_time(i)-1) ];
                     l = 1;
            end;
            if strcmp(fcode{m}, 'Interruption_Atem')==1 ||  strcmp(fcode{m}, 'Interruption_Ton')==1 ||  strcmp(fcode{m}, 'Ende')==1 
                i = i+1;
                if order == 1;
                           event_types(i)=2;
                elseif order == 2;
                           event_types(i) = 1;
                end;
                event_time(i) = round((round((str2num(ftime{j})-ftime_start)/10)/TR)*10)/10;
                onsets{event_types(i)} = [onsets{event_types(i)} (event_time(i)-2)]; 
                l=1;
            end;
         end;
     end;
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
for l=1:length(onsets)
    durations{l}=onsets{l}*0+2;
end
durations = (durations)';

cd(subj_dir);
cd('onsets');
save(strcat(prefix,name,'_time2.mat'), 'names', 'onsets', 'durations');
if computer ==1
    cd ('/home/hannah/Mindfulness_fMRI/01_onsets');
elseif computer ==2
    cd('/Volumes/INTENSO/MF_MRTStudie/03_Auswertung');
end
end


    
    
    