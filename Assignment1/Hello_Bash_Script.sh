#!/bin/bash
echo "Welcome Junjie! Have a nice day!!🔥🔥🔥"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "you are building on version" $version
echo "1 for conitue 0 for quit"
read number
versioncontinue=$number 

echo "----Program init---------"
if [ $versioncontinue == 1 ] 
then  
	echo "--------------------------------"
	echo "OK"
  
else
	echo "later"
  echo "----- program ends-------------"
fi

if [ $file == "source/scretinfo.md" ]
  then 
  	echo "--------------------------------"
  	echo  "it is not notbeing copied"
  else
    echo "--------------------------------"
  	echo "it is being copied"  	 
  fi
  
  
for file in source/*
	do 
  	echo $file
    
  if [ "$file" == "source/screeninfo.md" ]
  then 
  	echo "it is not being copied"
	else
  	echo "copying file: " $file
  	cp $file build/
  fi
done

cd build/ 
echo "###############################"
echo "-------------------------------"
echo "your files has been copied"
echo "-------------------------------"
echo "##############################"


# git commit 
echo "------------------------------"
echo "---Committing to GitHub-------"
git log
git add .
git commit -am "test"
git push origin master
cd ..
  
# Copy secretinfo.md but replace “42” with “XX”.
cd source/
sed "s/42/YY/g" secretinfo.md 






