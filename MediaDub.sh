clear 




# Get the directory of the current script
SCRIPT_DIR=$(dirname "$0")


THISVERSION="1.0.1"
ThisExplained="Shell designed for dubbing media materials from a primary source\nto multiple clones and backup destinations.\n"
                                         
echo "\n"
echo "▗▖  ▗▖▗▄▄▄▖▗▄▄▄ ▗▄▄▄▖ ▗▄▖     ▗▄▄▄ ▗▖ ▗▖▗▄▄▖ "
echo "▐▛▚▞▜▌▐▌   ▐▌  █  █  ▐▌ ▐▌    ▐▌  █▐▌ ▐▌▐▌ ▐▌"
echo "▐▌  ▐▌▐▛▀▀▘▐▌  █  █  ▐▛▀▜▌    ▐▌  █▐▌ ▐▌▐▛▀▚▖"
echo "▐▌  ▐▌▐▙▄▄▖▐▙▄▄▀▗▄█▄▖▐▌ ▐▌    ▐▙▄▄▀▝▚▄▞▘▐▙▄▞▘"
echo  "\nV."$THISVERSION
echo "\nCreated by Peter J. Haas\n"       
# Future command screens:
# echo "Options:\n [1] Edit Config File\n [2] Create Material Dubs\n [3] Quit\n"                                 
echo ${ThisExplained}
read -p "Press [Enter] key to continue..."

source $SCRIPT_DIR/FeatureSync.sh