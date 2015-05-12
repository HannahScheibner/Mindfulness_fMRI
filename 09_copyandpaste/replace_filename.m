for filename in *2015_01-11*; do echo mv \"$filename\" \"${filename//2015-01-11/MF_u_HC}\"; done > rename.txt

for filename in *2015-01-11*; do mv "$filename" "${filename//2015-01-11/MF_u_HC_103}"; done
