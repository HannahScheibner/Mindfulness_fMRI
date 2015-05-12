
for j in 104 105 108 110 112 113 115 116 119 204 206 207 209 211 212 214 215 220 221 222
do
	cd /home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeit_MRT_Daten/Probanden/
	cd $j
	cd NIFTI/MF_Task_0005
	mv *00001-1.nii	../0005_deleted
	mv *00002-1.nii	../0005_deleted
	mv *00003-1.nii	../0005_deleted
	mv *00004-1.nii	../0005_deleted
	mv *00005-1.nii	../0005_deleted
	cd ../MF_Task_0006
	mv *00001-1.nii	../0006_deleted
	mv *00002-1.nii	../0006_deleted
	mv *00003-1.nii	../0006_deleted
	mv *00004-1.nii	../0006_deleted
	mv *00005-1.nii	../0006_deleted
	cd ../MF_Task_0007
	mv *00001-1.nii	../0007_deleted
	mv *00002-1.nii	../0007_deleted
	mv *00003-1.nii	../0007_deleted
	mv *00004-1.nii	../0007_deleted
	mv *00005-1.nii	../0007_deleted
	cd ../MF_Task_0008
	mv *00001-1.nii	../0008_deleted
	mv *00002-1.nii	../0008_deleted
	mv *00003-1.nii	../0008_deleted
	mv *00004-1.nii	../0008_deleted
	mv *00005-1.nii	../0008_deleted
done
