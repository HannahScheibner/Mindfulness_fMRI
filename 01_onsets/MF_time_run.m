%allsubs      = [100,  103, 104, 105, 108,  110, 112:116, 119, 
%201, 203, 204, 206, 207, 208, 209, 211, 212, 214:215,220:222];
for i = 100:119
    if any(i == [100, 103, 104, 105, 108, 110, 112:116, 119])
    MF_time_Motor_1late(num2str(i), '-01_fMRT_mindfulness_internal_15_sce.log')
    MF_time_Motor_1late(num2str(i), '-02_fMRT_mindfulness_external_15_sce.log')
    MF_time_Motor_1late(num2str(i), '-03_fMRT_mindfulness_internal_7.log')
    MF_time_Motor_1late(num2str(i), '-04_fMRT_mindfulness_external_7.log')
    end
end



for i = 200:222
    if any(i == [201, 203, 204, 206:209, 211:212, 214:215,220:222])
    MF_time_Motor_1late(num2str(i), '-01_fMRT_mindfulness_external_15_sce.log')
    MF_time_Motor_1late(num2str(i), '-02_fMRT_mindfulness_internal_15_sce.log')
    MF_time_Motor_1late(num2str(i), '-03_fMRT_mindfulness_external_7.log')
    MF_time_Motor_1late(num2str(i), '-04_fMRT_mindfulness_internal_7.log')
    end
end


