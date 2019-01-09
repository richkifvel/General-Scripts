#!/bin/bash

#echo enter username
#read username
#echo username is $username


### SET VARIABLES

echo enter new username FIRSTname
read firstname
#echo username is $firstname

echo enter new username SURname
read surname

echo enter user password
read password1

echo confirm user password
read password2

if [ "$password1" == "$password2" ]

	then password="$password1"
		 echo Password set to $password
		 PwVar=OK

	else echo ERROR Passwords Do Not Match! Unable to create user!
		 PwVar=NAY
fi	


username="$firstname$surname"
echo username is $username

fullname="$firstname $surname"
echo $fullname





if [ $PwVar = "OK" ]

	then echo Creating user account for $fullname

		sudo dscl . -create /Users/$username
		sudo dscl . -create /Users/$username UserShell /bin/bash
		sudo dscl . -create /Users/$username RealName $fullname
		sudo dscl . -create /Users/$username UniqueID 504
		sudo dscl . -create /Users/$username PrimaryGroupID 504
		sudo dscl . -create /Users/$username NFSHomeDirectory /Users/$username
		sudo dscl . -passwd /Users/$username $password

		sudo cp -R "/System/Library/User Template/English.lproj" /Users/$username

		sudo chown -R $username /Users/$username

		sudo dscl . delete /Users/"$username" JPEGPhoto
		sudo dscl . delete /Users/"$username" Picture
	

	else echo Passwords did not match, unable to create user

fi 

#my_array=( $(dscl . list /Users | grep $username) )

#sudo dscl . list /Users

#if [[ "$WORD" =~ ^("$username")$ ]]; then
#    echo "$WORD is in the list"
#else
#    echo "$WORD is not in the list"
#fi

#echo new user full name is $firstanme $surname




