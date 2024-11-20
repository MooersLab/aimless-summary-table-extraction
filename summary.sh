function summary {
echo "This script extracts the summary table from the aimless.log file."
ehco "It assumes that the output files are stored by run number following the converntion used by autoxds."
echo "This script takes the file stem name of a image file and the run number as two arguments in that order."
echo "This script returns the summary table from a aimless.log file."
echo "This is faster than navigating to the folder and searching the log file for the summary table with vim."
if [ $# -lt 2 ]; then
   echo 1>&2 "$0: not enough arguments"
   echo "Usage: summary 3091 1"
   return 2
elif [ $# -gt 2 ]; then
   echo 1>&2 "$0: too many arguments"
   echo "Usage: summary 3091 1"
   return 2
fi
rm -f tmp
# touch $1aimlessRun$2Summary.txt
awk '/SUMMARY_BEGIN/,/SUMMARY_END/' $1_$2_xds/$1_$2_aimless.log > tmp && mv tmp $1aimlessRun$2Summary.txt
echo "Use spacebar to move forward a page and `b` to go back a page. Use `q` to quit the more viewer."
more $1aimlessRun$2Summary.txt
}

