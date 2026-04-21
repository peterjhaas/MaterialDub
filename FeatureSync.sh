# Custom RSYNC for feature film project 2026
# This template can be modified to make copying files easy and sane.  
# What is nice is that it can be done on any terminal based machine and doesn't require extensive software licenses, only that you have your directories organized.



# FILES TO SYNC
# Modify this section to represent the necessary paths for file transfer.
# Define the source drive location
# Define the target drive location 
# Define location of the log files

dirSOURCE=("/Volumes/26F/Day01")							# Where does it come from? (That is to say, the source).
dirTARGET=("/Volumes/Leviathan/26F/")						# Where does it go?
# dirTARGET2=("/Volumes/TK/")								# turn on this line to enable a second round of rsync to another drive.
# dirTARGET3=("/Volumes/TK/")								# turn on this line to enable a third round of rsync to another drive.
dirLOG=("/Volumes/26F/Logs/")								# Tell me what happened (Cotten-Eyed Joe) 



# !!! WARNING !!! DON'T TOUCH BELOW UNLESS YOU KNOW WHAT YOU'RE DOING !!! You have been warned.

# System definitions for building a log-file
myDate=$(date "+%Y-%m-%d_[%H.%M.%S]")_logFile.txt			
myLOG=${dirLOG}${myDate}

#Text Formatting for UX
NC='\033[0m' # No Color
BLUE='\033[0;34m'
bold=$(tput bold)
unbold=$(tput sgr0)


clear
echo "${BLUE}${bold}# Media Dub ${unbold}${NC}"			# give ourselves a nice little title.
echo " "
echo 'Media Dub\n'$myDate'\n***' >> $myLOG 
echo "${BLUE}## Directory Information${NC}"
echo "* Log File Directory: " $dirLOG | tee -a $myLOG 
echo "* Source Sync/Dub File Directory: "$dirSOURCE | tee -a $myLOG
echo "* Target Sync/Dub File Directory: "$dirTARGET | tee -a $myLOG
# reserved for Targets 2 and 3 
echo '\n***' >> $myLOG 
echo " "
echo "${BLUE}## Processing Dub Info ${NC}"
echo "* Gathering log-file information:" $myDate			# test code to check
echo "* Processing Checksum, please wait..."
echo " "

# MATERIAL DUBS
# Primary Material Dub
echo "${BLUE}## Dubbing to Primary Materials Drive${NC}"
rsync -av --checksum --progress --log-file=/Volumes/26F/Logs/$myDate --log-file-format='%i --File: %f [%o | %l | %i] %c' $dirSOURCE $dirTARGET
	
# TO DO: Second and Third Dub destinations.

#Close out the Process.
echo " "
echo "${BLUE}## Process Complete!${NC}"
echo "* Please review details in the log-file located at:" 
echo "  " $myLOG
echo " "
