cd /home/hannah/Dokumente/MF_MRTStudie/01_Daten/Probanden/


for j in 104 105 108 110 112 113 115 116 119 204 206 207 209 211 212 214 215 220 221 222
do
	cd /home/hannah/Dokumente/MF_MRTStudie/01_Achtsamkeit_MRT_Daten/Probanden/
	cd $j
	cd NIFTI/MF/1
	mv s8*	../../../../s8
	cd ../2
	mv s8*	../../../../s8
	cd ../3
	mv s8*	../../../../s8
	cd ../4
	mv s8*	../../../../s8
done
