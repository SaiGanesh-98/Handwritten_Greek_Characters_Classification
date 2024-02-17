#!/bin/bash

# removing previous Query folder if present
rm -rf Query

# unzipping the dataset
unzip dataset.zip

# moving in the dataset folder
cd Query

# renaming files inside _SUFF
echo Renaming files inside _SUFF
for folder in *_SUFF*; do
	rename 's/form/suff/' $folder/*;
done

# renaming folders from _SUFF to their final name
echo Renaming folders from _SUFF to their final name
rename -f 's/LETT_(CAP|SML)_SUFF\.([A-Z]+)/$1_$2/' *

# moving images from _NORM folders to the folders renamed just before
echo Moving images from _NORM folders to the folders renamed just before
for folder in *_NORM*; do
	if [[ $folder =~ .*_(CAP|SML)_.*\.([A-Z]+) ]]; then
		mv $folder/* ${BASH_REMATCH[1]}_${BASH_REMATCH[2]}/;
		# removing now empty folders
		rm -r $folder;
	fi
done

# renaming the files in each folder
for folder in *; do
	if [[ $folder =~ (CAP|SML)_([A-Z]+) ]]; then
		i=0
		echo Renaming $folder files
		for file in $folder/*; do
			mv $file $folder/${BASH_REMATCH[1]}_${BASH_REMATCH[2]}_$i.bmp;
			let i=i+1;
		done
	fi
done

# placing everything in the dataset folder, deleting if previously present
echo Placing everything inside the dataset folder
cd ..
rm -rf dataset
mkdir dataset
mv Query/* dataset/
rm -r Query
