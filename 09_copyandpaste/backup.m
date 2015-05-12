
for j in 100 208 103 114 201 203 207 209 211 212 214 215 220 221 222
do
	cd /home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/
	cd $j
	cd NIFTI/MF/1
	cp s8*	/media/hannah/INTENSO/MF_MRTStudie/01_Daten/Probanden/$j/NIFTI/Vorverarbeitung/1
	cd /home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/$j/NIFTI/MF/2
	cp s8*	/media/hannah/INTENSO/MF_MRTStudie/01_Daten/Probanden/$j/NIFTI/Vorverarbeitung/2
	cd /home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/$j/NIFTI/MF/3
	cp s8*	/media/hannah/INTENSO/MF_MRTStudie/01_Daten/Probanden/$j/NIFTI/Vorverarbeitung/3
	cd /home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/$j/NIFTI/MF/4
	cp s8*	/media/hannah/INTENSO/MF_MRTStudie/01_Daten/Probanden/$j/NIFTI/Vorverarbeitung/4
done
