# Media Dub, originally called FeatureSync
# Created by Peter J. Haas (https://www.peterjhaas.com)
# I wanted to create a tool that would simplify the process of dubbing safety copies of media materials.
#
# Custom RSYNC for use by creative post-production and DIT teams for low-budget media projects. 
# This shell will read the SOURCE directory such as media card (CF/SD/etc.,) and dub the files to new target directories.
# The dubbing process will skip over any previously existing files that have not been modified, allowing for cleaner copies and more frequent backups on set without worrying about formatting cards.
# We developed this as we are shooting DVCAM to CF, and each card can hold more than one day's worth of footage.  It allows CF cards to become a temporary "emergency primary source" backup.
#
# The shell defaults to a single source and single destination.  If you would like multiple dubs, un-comment the correct lines noted below.

# FILES TO SYNC
# Modify this section to represent the necessary paths for file dubs.
# Define the source drive location - make sure this path leads to the primary source materials.
#	Make sure to turn on the target drives you want to include.
# Define the target drive locations - point each of these to the drives you wish to dub materials to.
# Define location of the log files

dirSOURCE=("/Volumes/TK/")			
dirTARGET=("/Volumes/TK/")
# dirTARGET2=("/Volumes/TK/")							
# dirTARGET3=("/Volumes/TK/")							
dirLOG=("/Volumes/26F/Logs/")								


# System definitions for building a log-file
myDate=$(date "+%Y-%m-%d_[%H.%M.%S]")	
myAPND=('_logFile.txt')
myLOG=${dirLOG}${myDate}${myAPND}

# clear the screen
# give ourselves a nice little title and report key directory information both to screen and to the log-file.

clear
echo "# Media Dub\n\n## Session Information\n* No.: "$myDate"\n* Log File Directory: "$dirLOG "\n* Source Sync/Dub File Directory: "$dirSOURCE "\n* Target Sync/Dub File Directory: "$dirTARGET | tee -a $myLOG
# Turn on for Destination Targets 2 and 3 
# echo "* Target Sync/Dub File Directory: "$dirTARGET2 | tee -a $myLOG
# echo "* Target Sync/Dub File Directory: "$dirTARGET3 | tee -a $myLOG
echo '\n' | tee -a $myLOG



# MATERIAL DUBS
# Primary Material Dub
echo "## Dubbing to First Materials Drive" | tee -a $myLOG
echo "* Preparing Dub...\n"

rsync -av --checksum --progress --log-file=$myLOG --log-file-format='%i --File: %f [%o | %l | %i] %c' $dirSOURCE $dirTARGET
	
# Turn on for second destination dub
# echo "## Dubbing to Second Materials Drive" | tee -a $myLOG
# echo "* Preparing Dub...\n"
# rsync -av --checksum --progress --log-file=$myLOG --log-file-format='%i --File: %f [%o | %l | %i] %c' $dirSOURCE $dirTARGET2

# Turn on for third destination dub
# echo "## Dubbing to Third Materials Drive" | tee -a $myLOG
# echo "* Preparing Dub...\n"
# rsync -av --checksum --progress --log-file=$myLOG --log-file-format='%i --File: %f [%o | %l | %i] %c' $dirSOURCE $dirTARGET3


#Close out the Process.
echo "\n## Process Complete!\n* Please review details in the log-file located at:\n"$myLOG"\n"

clear
cat $myLOG