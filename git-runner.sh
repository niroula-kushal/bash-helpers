#!/bin/bash
echo "Enter git command : "
read gitCmd
for i in ./*; 
do 
	if [[ -d $i ]]; then 
		cd $i 
		echo "************************************"
		echo "Running command for $i" 
		echo "************************************"
		$gitCmd
		cd ..
	fi; 
done
