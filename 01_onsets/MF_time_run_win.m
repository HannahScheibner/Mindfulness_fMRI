for i = 100:119
<<<<<<< HEAD
    if any(i == [100, 103, 105, 108, 110, 112:116, 119])
    MF_timefull(num2str(i), '-01_fMRT_mindfulness_internal_15_sce.log')
    MF_timefull(num2str(i), '-02_fMRT_mindfulness_external_15_sce.log')
    MF_timefull(num2str(i), '-03_fMRT_mindfulness_internal_7.log')
    MF_timefull(num2str(i), '-04_fMRT_mindfulness_external_7.log')
=======
    if any(i == [100, 103, 104, 105, 108, 110, 112:116, 119])
    MF_time_buttons(num2str(i), '-01_fMRT_mindfulness_internal_15_sce.log')
    MF_time_buttons(num2str(i), '-02_fMRT_mindfulness_external_15_sce.log')
    MF_time_buttons(num2str(i), '-03_fMRT_mindfulness_internal_7.log')
    MF_time_buttons(num2str(i), '-04_fMRT_mindfulness_external_7.log')
>>>>>>> c291f557a6cb6100524ae4459461e965b62a5ef9
    end
end



for i = 200:222
    if any(i == [201, 203, 204, 206:209, 211:212, 214:215,220:222])
    MF_time_buttons(num2str(i), '-01_fMRT_mindfulness_external_15_sce.log')
    MF_time_buttons(num2str(i), '-02_fMRT_mindfulness_internal_15_sce.log')
    MF_time_buttons(num2str(i), '-03_fMRT_mindfulness_external_7.log')
    MF_time_buttons(num2str(i), '-04_fMRT_mindfulness_internal_7.log')
    end
end


