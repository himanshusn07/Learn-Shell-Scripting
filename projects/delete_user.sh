#!/bin/bash
#
#Delete user automates the 4 steps to remove an account
#
############################
#Define functions
############################

get_answer()
{
	unset answer	#unset - removes any value previously set for "answer" variables
	ask_count=0

	while [ -z "$answer" ]		#while no answer is given, keep asking.
	do
		ask_count=$(($ask_count+1))

		echo $ask_count

		case $ask_count in	# if user gives no answer in time alloted
			2)
				echo
				echo "Please answer the question"
				echo
				;;
			3)
				echo
                                echo "One last try, please answer the question"
                                echo
				;;
			4)
				echo
                                echo "Since you refuse to answer the question....."
                                echo "Exiting the program"
				echo
				
				exit
				;;
		esac


		if [ -n "$line2" ];	# -n - empty string
			then		# Print 2 lines
				echo $line1
				echo -e $line2" \c"	# \c - produces no further output
			else		# Print 1 line
				echo -e $line1" \c"
		fi

		# Allow 60 seconds to answer before time-out

		read -t 60 answer
	done

	# Do a little variable cleanup
	
	unset line1
	unset line2

}	# End of get_answer function

##################################

process_answer()
{
	answer=$(echo $answer | cut -c1)	# c1- cutting the answer t its first character only

	case $answer in
		y|Y)
			# If user answers "yes", do nothing
			;;
		*)
			# If user answers anything but "yes", exit script
			echo
			echo $exit_line1
			echo $exit_line2
			echo
			exit
			;;
	esac

	unset $exit_line1
	unset $exit_line2

}	# End of process_answer function

###################################

#	Main Script
# Get name of user account to check

echo "Step #1 - Determine user account name to delete"
echo
line1="Please enter the username of the user"
line2="Account you wish to delete from the system: "

get_answer

user_account=$answer

# Double check with script user to confirm the correct user account

line1="Is $user_account the user account?"
line2="You wish to delet from the system? [y/n]"
get_answer

# Call process_answer function, if user answers anything but "yes" exit script

exit_line1="Because the account, $user_account, is not"
exit_line2="the one you wish to delete, we are leaving the script"
process_answer

####################################
# Check that user_account is really an account on the system\

user_account_record=$(cat /etc/passwd | grep -w $user_account)	# -w=exact match

if [ $? -eq 1 ]
then
	echo
	echo "Account, $user_account, not found"
	echo "Exiting the script"
	echo
	exit
fi

echo
echo "I found the record"
echo $user_account_record
echo

line1="Is this the correct user account? [y/n]"
get_answer

# Call process_answer function, if user answers anything but "yes" exit script

exit_line1="Because the account, $user_account, is not"
exit_line2="the one you wish to delete, we are leaving the script"
process_answer

#################################
# Seach for any running processes which belong to the user

echo
echo "Step #2 - Finding processes in the system belonging to the user account"
echo

ps -u $user_account> /dev/null	# List user processes running

case $? in
	1)	#No processes running for this user
		echo "There are no processes currently running for this user"
		echo
		;;
	0)	#Processes running for this user
		# Ask script user if wants to kill the processes

		echo "$user_account has following process(es) running"
		ps -u $user_account

		line1="Would you like to kill the process(es)? [y/n]"
		get_answer

		answer=$(echo $answer | cut -c1)

		case $answer in
			y|Y)
				echo
				echo "Killing off process(es)...."

				# List user processes running code in command_1
				command_1="ps -u $user_acount --no-heading"

				# Create command_3 to kill processes in variable
				command_3="xargs -d \\n /usr/bin/sudo /bin/kill -9"

				# Kill processes by piping the commands together
				$command_1 | gawk '{print $1}' | command_3

				echo
				echo "Processes killed"
				;;
			*)	# If user answers anything but yes, do not kill
				echo
				echo "Will not kill process(es)"
				;;
		esac
		;;
esac


###############################
# Create a report of all files owned by user account

echo
echo "Step #3 - Find files on the system owned by the user account"
echo
echo "Creating a report of all files owned by $user account"
echo
echo "It is recommended that you backup/retrieve these files"
echo "and then do one of two things:"
echo "1) Delete the files"
echo "2) Change the files' ownership to a current user account"
echo
echo "Please wait. This may take a while"

report_date=$(date +%y%m%d)
report_file="$user_account"_Files_"$report_date".rpt

find / -user $user_account> $report_file 2>/dev/null

echo
echo "Report is complete"
echo "Name of report: $report_file"
echo -n "Location of report: "; pwd	# -n = do not output the trailing new line
echo

################################
# Removing the user account

echo
echo "Step #4 - Removing the user account"
echo

line1="Do you wish to remove the $user_account's account from the system? [y/n]"
get_answer

# Call process_answer function, if user answers anything but "yes" exit script
exit_line1="Since you do not wish to remove the user account,"
exit_line2="$user_account at this time, exiting the script...."
process_answer

sudo userdel $user_account

echo
echo "User account, $user_account, has been removed"
echo

exit
