#!/bin/bash
opt=1
while [ "$opt" -lt 6 ]
do
	echo "1 Create AddressBook"
	echo "2 Insert into AddressBook"
	echo "3 Display AddressBook"
	echo "4 Delete a Record"
	echo "5 Modify a Record"
	echo "Enter the Option"
	read opt
	case "$opt" in
	"1")
		echo "Enter name of directory"
		read db
		touch "$db"
		;;
	"2")
		echo "Enter AddressBook"
		read db
		count=1
		while [ "$count" -gt 0 ]
		do
			echo "Enter Name"
			read nm
			echo "Enter Address"
			read ad
			echo "Enter Phone Number"
			read pn
			echo "$nm, $ad, $pn" >> "$db"
			echo "Type 0 to STOP, 1 to ADD another record"
			read count
		done
		;;
	"3")
		echo "Enter name of AddressBook"
		read db
		cat "$db"
		;;
	"4")
		echo "Enter name of AddressBook"
        	read db
		echo "Delete record Enter Name/ Phone Number"
		read pattern
		temp="temp"
		grep -v "$pattern" "$db" | cat >> "$temp"
		rm "$db"
		cat "$temp" | cat >> "$db"
		rm "$temp"
		;;
	
	"5")
		echo "Enter name of AddressBook"
		read db
		echo "Enter Name/Phone number of Record you want to Update"
		read pattern
		temp="temp"
		grep -v "$pattern" "$db" | cat  >> "$temp"
		rm "$db"
		cat "$temp" | cat >> "$db"
		rm "$temp"
		echo "Enter Updated Name"
		read nm
		echo "Enter Updated Address"
		read ad
		echo "Enter Updated Phone Number"
		read pn
		echo -e "$nm, $ad, $pn" | cat >> "$db"
		;;
	esac

done
