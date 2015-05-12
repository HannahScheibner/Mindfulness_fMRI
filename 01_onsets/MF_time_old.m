

function [names, onsets, durations] = MF_time(prefix, name)

%logdir = 'C:\Users\scheibha\Dropbox\16_Neuroimaging Paradigm05_Daten/Auswertung/Logfiles';
%logdir = '/Users/hannahscheibner/.dropbox-two/Dropbox/16_Neuroimaging Paradigm/05_Daten/Auswertung/';
logdir = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeitsstudie_MRT_Daten', prefix, '/');


%subj_dir = strcat('/Users/hannahscheibner/.dropbox-two/Dropbox/16_Neuroimaging Paradigm/05_Daten/Auswertung/', prefix, '/');
subj_dir = strcat('/home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeitsstudie_MRT_Daten/Probanden/', prefix, '/');
%full_prefix=strcat(logdir, prefix,'/' );
%target_prefix=strcat(subj_dir, prefix);


%filename = strcat(full_prefix, prefix, '_reward.log');
filename = strcat(subj_dir, 'log/' ,prefix, name)




[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);




ftime_start = 0;
for j = 1:length(fcode)
    if strcmp(fevent{j},'Pulse') == 1
        if ftime_start == 0
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
        k = j;
        l = 0;
        for m=k:length(fcode)
                if strcmp(fevent{m}, 'Response') ==1 && l==0
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
                        onsets{event_types(i)} = [onsets{event_types(i)} (event_time(i))];
                        %onsets{event_types(i)} = [onsets{event_types(i)} (event_time(i)-1) ];
                        l = 1;
                end;
         end;
     end;
end;                          
   



achtsam = onsets{1,1};
if size(achtsam)~=[0,0]
    achtsam2(:,1) = achtsam(1,:);
    onsets2{1,1} = achtsam2;
else
    onsets2{1,1}=[];
end;

abgelenkt = onsets{2,1};
if size(abgelenkt)~=[0,0]
    abgelenkt2(:,1) = abgelenkt(1,:);
    onsets2{1,2} = abgelenkt2;
else
    onsets2{1,2}=[];
end;




names = conditions;

cd(subj_dir);
save(strcat(prefix,name,'_time.mat'), 'names', 'onsets2', 'onsets');


    
    
    