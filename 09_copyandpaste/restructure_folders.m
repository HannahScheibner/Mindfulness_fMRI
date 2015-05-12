for j in 104 105 108 110 112 113 115 116 119 204 206 207 209 211 212 214 215 220 221 222
do
	cd /home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeit_MRT_Daten/Probanden/
	cd $j
	cd NIFTI
	mkdir MF
	mv MF_Task_0005 MF/1
	mv MF_Task_0006 MF/2
	mv MF_Task_0007 MF/3
	mv MF_Task_0008 MF/4
done

