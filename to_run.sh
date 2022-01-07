#!/bin/bash
# echo "This script is about to run another script."
DATE_BIN=$(command -v date)
# dateVariable = `${DATE_BIN} +"%Y-%m-%d %T"`
#                     date
dateVariable="2022-01-01 00:00:00"
# echo "datevariable is" $dateVariable
counter=1
var=$(git log 2>&1)
# echo "this is log" $var

# for i in ${!var[@]}; do
#   echo "element $i is ${var[$i]}"
# done
day=01
hr=00
min=$(( $RANDOM % 60 ))
sec=$(( $RANDOM % 60 ))
arrayvar=($var)
#  b5f0886be081d32f887b3dbd76ccab49a2760534
# for (( i=${#arrayvar[@]}-1 ; i>=0 ; i-- )) ; do
for i in ${!arrayvar[@]}; do
 if [ ${#arrayvar[$i]} -eq 40 ];
 then
    min=$(( $RANDOM % 60 ))
    sec=$(( $RANDOM % 60 ))
    currentDate="2022-01-${day} ${hr}:${min}:${sec}"
    echo "this is commit ${arrayvar[$i]}"
    sh ./git-cdc.sh ${arrayvar[$i]} ${currentDate}
    #  date_timestamp=$(date -d "$currentDate" +%s)
    #  export GIT_AUTHOR_DATE="$date_timestamp"
    #  export GIT_COMMITTER_DATE="$date_timestamp"
    echo "this is date------------------------------------------------------" ${currentDate}
    hr=$(( $hr + 1 ))
    if [ $hr -ge 23 ]; 
    then
      hr=00
      day=$(( $day + 1 ))
    fi
 fi 
done
# IFS='commit' #setting space as delimiter  
# read -ra ADDR <<<"$var" #reading str as an array as tokens separated by IFS  
  
# for i in "${ADDR[@]}"; #accessing each element of array  
# do  
# echo "$i"  
# done  

# while [ $counter -le 46 ]
# do
#     NEWDATE=`TZ=GMT+${counter} date +%Y-%m-%d" "%H:%M:%S`
#     echo $NEWDATE
#     ((counter++))
# done
# sh ./git-cdc.sh e18f29104c4df5c77f0c7271f68f7b483259c2b2 ${dateVariable}
# echo "This script has just run another script."