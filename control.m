


for i = 100:119
    if any(i == [100, 103, 104, 105, 108, 110, 112:116, 119])

prefix = num2str(i);
subj_dir = strcat('F:\MF_MRTStudie\01_Daten\Probanden\', prefix, '\');


name='-01_fMRT_mindfulness_internal_15_sce.log';
filename = strcat(subj_dir, 'log\' ,prefix, name);
[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
%
count = cell(4,1)
count_ende = cell(4,1)
time = cell(4,1)

i = 0
for j= 1:length(fcode)
    if strcmp(fevent{j},'Pulse') == 1
        i = i+1;
        if i == 1
            start_time=str2num(ftime{j});
        end
    end
    
    if strcmp(fcode{j}, 'Ende')==1
        count_ende{1} = [i];
        end_time = str2num(ftime{j});
    end
     
end
count{1} = [i];
time{1} = [((end_time - start_time)/10000)];



name= '-02_fMRT_mindfulness_external_15_sce.log';
filename = strcat(subj_dir, 'log\' ,prefix, name);
[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
%


i = 0
for j= 1:length(fcode)
    if strcmp(fevent{j},'Pulse') == 1
        i = i+1;
        if i == 1
            start_time=str2num(ftime{j});
        end
    end
    
    if strcmp(fcode{j}, 'Ende')==1
        count_ende{2} = [i];
        end_time = str2num(ftime{j});
    end
end
count{2} = [i];
time{2} = [(end_time-start_time)/10000];


name = '-03_fMRT_mindfulness_internal_7.log';
filename = strcat(subj_dir, 'log\' ,prefix, name);
[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
%

i = 0
for j= 1:length(fcode)
    if strcmp(fevent{j},'Pulse') == 1
        i = i+1;
        if i == 1
            start_time=str2num(ftime{j});
        end
    end
    
    if strcmp(fcode{j}, 'Ende')==1
        count_ende{3} = [i];
        end_time = str2num(ftime{j});
    end
end
count{3} = [i];
time{3} = [(end_time-start_time)/10000];


name = '-04_fMRT_mindfulness_external_7.log';
filename = strcat(subj_dir, 'log\' ,prefix, name);
[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
%

i = 0
for j= 1:length(fcode)
    if strcmp(fevent{j},'Pulse') == 1
        i = i+1;
        if i == 1
            start_time=str2num(ftime{j});
        end
    end
    
    if strcmp(fcode{j}, 'Ende')==1
        count_ende{4} = [i];
        end_time = str2num(ftime{j});
    end
end
count{4} = [i];
time{4} = [(end_time-start_time)/10000];


save(strcat(prefix,name,'control.mat'), 'count', 'count_ende', 'time');
    end
end





for i = 200:222
    if any(i == [201, 203, 204, 206:209, 211:212, 214:215,220:222])

prefix = num2str(i);
subj_dir = strcat('F:\MF_MRTStudie\01_Daten\Probanden\', prefix, '\');


name='-01_fMRT_mindfulness_external_15_sce.log';
filename = strcat(subj_dir, 'log\' ,prefix, name);
[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
%
count = cell(4,1)
count_ende = cell(4,1)

i = 0
for j= 1:length(fcode)
    if strcmp(fevent{j},'Pulse') == 1
        i = i+1;
    end
    
    if strcmp(fcode{j}, 'Ende')==1
        count_ende{1} = [i];
    end
end
count{1} = [i];



name= '-02_fMRT_mindfulness_internal_15_sce.log';
filename = strcat(subj_dir, 'log\' ,prefix, name);
[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
%


i = 0
for j= 1:length(fcode)
    if strcmp(fevent{j},'Pulse') == 1
        i = i+1;
    end
    
    if strcmp(fcode{j}, 'Ende')==1
        count_ende{2} = [i];
    end
end
count{2} = [i];

name = '-03_fMRT_mindfulness_external_7.log';
filename = strcat(subj_dir, 'log\' ,prefix, name);
[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
%

i = 0
for j= 1:length(fcode)
    if strcmp(fevent{j},'Pulse') == 1
        i = i+1;
    end
    
    if strcmp(fcode{j}, 'Ende')==1
        count_ende{3} = [i];
    end
end
count{3} = [i];

name = '-04_fMRT_mindfulness_internal_7.log';
filename = strcat(subj_dir, 'log\' ,prefix, name);
[subj, ftrial, fevent, fcode, ftime, fttime, funcertianty, fduration, funcertainty, freqtime, freqdur] = textread(filename, '%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', '\t', 'headerlines', 5);
%

i = 0
for j= 1:length(fcode)
    if strcmp(fevent{j},'Pulse') == 1
        i = i+1;
    end
    
    if strcmp(fcode{j}, 'Ende')==1
        count_ende{4} = [i];
    end
end
count{4} = [i];

save(strcat(prefix,name,'control.mat'), 'count', 'count_ende');
    end
end

    
    