#############################################################################
#01.12.2014
#		
#
#		Mindfulness - MRT Experiment
#		
#
#		Scenario - File for fMRI
#
#     
#		
#		***************
#
#
#############################################################################



#############################################################################
##
## SDL header part
##
#############################################################################

scenario = "Experiment 1";
pcl_file = "fMRT_mindfulness_pcl.pcl";

scenario_type = fMRI_emulation;
#*scanner:
#scenario_type = fMRI;
#before:
#scenario_type = trials;

pulses_per_scan = 1;
pulse_code = 99; 
response_matching = simple_matching; 
#response_port_output=false;

# only for emulation
scan_period = 2000;

# defaults
default_background_color =0,0,0; 
screen_width = 1280;						
screen_height = 720;							
screen_bit_depth = 32;  

# response buttons
active_buttons = 3;
button_codes = 1,2,3;	
target_button_codes = 11,12,13; #fuers logfile: Tasten Maus links/rechts, Leertaste


            		 
#############################################################################
##
## Stimuli
##
#############################################################################




begin;

text {caption = " Führen Sie die 'Aufmerkamkeit auf den Atem'
Übung durch. 

Wenn der Gong ertönt, beantworten Sie
die Frage auf dem Bildschirm."; system_memory = true; font_size = 32;} Instructions_text;

text {caption = "Atem"; system_memory = true; font_size = 38;} internal_text;
text {caption = "Ton"; system_memory = true; font_size = 38;} external_text;


text {caption = "+"; system_memory = true; font_size = 38;} fix_cross_text;
picture {text fix_cross_text;x = 0; y = 0;}fixcross;

sound { wavefile{ filename = "bell.wav";}; attenuation =0.25; } bell; 

bitmap {filename = "kastenw1.bmp"; scale_factor = 0.1;}kastenw1;
bitmap {filename = "kastenw2.bmp";scale_factor = 0.1;}kastenw2;
bitmap {filename = "kasteng1.bmp";scale_factor = 0.1;}kasteng1;
bitmap {filename = "kasteng2.bmp"; scale_factor = 0.1;}kasteng2;



############# Trials ##############################################

trial{
	trial_type=fixed;
	trial_duration = 2000;
	picture {
				text internal_text;
				x = 0; y = 0;
				} ;
	} Condition_internal;

trial{
	trial_type=fixed;
	trial_duration = 2000;
	picture {
				text external_text;
				x = 0; y = 0;
				} ;
	} Condition_external;


trial{
	trial_type=fixed;
	trial_duration = 10000;
	picture {
				text Instructions_text;
				x = 0; y = 0;
				} Instructionspic;
	} Instructionstrial;
	
trial{
	trial_type= fixed;
	trial_duration=stimuli_length;
	#stimulus_event{
		#sound bell;
		#code = "Beginning";
		#deltat = 1500;
		#duration = 1000;	
	#}bell1;
	stimulus_event{
		picture fixcross;
		code = "Fixcross";
		deltat = 0;
		duration = 10000;
	}ITI1;
	stimulus_event{
		#picture fixcross;
		sound bell;
		code = "Interuption";
		deltat = 10000; 
		duration = 500;	
	}bell1;
}mindfulness_internal_trial;

trial{
	trial_type= fixed;
	trial_duration=stimuli_length;
	#stimulus_event{
		#sound bell;
		#code = "Beginning";
		#deltat = 1500;
		#duration = 1000;	
	#}bell1;
	stimulus_event 	
	{picture fixcross;
		code = "Fixcross";
		deltat = 0;
		duration = 10000;}ITI2;
	stimulus_event{
		sound bell;
		loop_playback = true;
		deltat = 0;
		duration = 10000;
	}tone;
	stimulus_event #picture fixcross;
		sound bell;
		code = "Interuption";
		deltat = 10000; 
		duration = 500;	
	}bell2;
}mindfulness_external_trial;



trial {
	trial_type = specific_response;
	trial_duration = 6000;
	terminator_button = 1,2;
		stimulus_event {
			picture {
				text {
				caption = "Als die Klangschale ertönte, war ich gerade...";
				font_size = 20;
				font_color = 255,255,255;
				} WowarenSie1_txt;
			x=0; y=160;
			bitmap kastenw1;
			x= -70; y= 90;
			bitmap kastenw2;
			x= 70; y= 90;
			text {
				caption = "achtsam";
				font_size = 16;
				font_color = 255, 255, 255;}achtsamantwort ;
			x = -90; y = 40;  
			text {
				caption = "abgelenkt";
				font_size = 16;
				font_color = 255, 255, 255;}abgelenktantwort ;
			x = 90; y = 40;
			} rat_1_pic;
			time = 0;
			code = "Frage";
			response_active = true;
		} ;
} Rating_trial; 

trial {
	trial_type = fixed;
	trial_duration = 500;
		stimulus_event {
			picture {
				text {
				caption = "Als die Klangschale ertönte, war ich gerade...";
				font_size = 20;
				font_color = 255,255,255;
				};
			x=0; y=160;
			bitmap kastenw1;
			x= -70; y= 90;
			bitmap kastenw2;
			x= 70; y= 90;
			text {
				caption = "achtsam";
				font_size = 16;
				font_color = 255, 255, 255;} ;
			x = -90; y = 40;  
			text {
				caption = "abgelenkt";
				font_size = 16;
				font_color = 255, 255, 255;} ;
			x = 90; y = 40;
			} feedback_pic;
			time = 0;
		} ;
} Feedback_trial; 


