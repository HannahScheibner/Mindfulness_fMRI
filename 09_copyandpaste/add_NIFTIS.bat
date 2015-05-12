#!/bin/sh
for j in 104 105 108 110 112 113 115 116 119 204 206 207 209 211 212 214 215 220 221 222
do
	cd /home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeit_MRT_Daten/Probanden/
	cd $j
	cd NIFTI/0005_deleted
	mv *00006-1.nii	../MF_Task_0005
	cd ../0006_deleted
	mv *00006-1.nii	../MF_Task_0006
	cd ../0007_deleted
	mv *00006-1.nii	../MF_Task_0007
	cd ../0008_deleted
	mv *00006-1.nii	../MF_Task_0008
done
