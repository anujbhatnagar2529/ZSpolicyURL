#!/bin/bash

#Generate Linux based time stamp
epochstamp=$(date +%s)

#Generate uniq string
randomString=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1 | awk '{print tolower($0)}')

helpFunction()
{

   echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
   echo ""
   echo -e "\t Possible ways to call the utility..."
   echo ""
   echo -e "\t ---------------------------------------"
   echo -e "\t For Staging and Production Environment-"
   echo -e "\t Usage: $0 -a [stg|prd] -b [apac|emea|amer] -c [devid]"
   echo -e "\t "
   echo -e "\t For Client Environment-"
   echo -e "\t Usage: $0 -a [cmr] -b [apac|emea|amer] -c [cmrid]"
   echo -e "\t ---------------------------------------"
   echo ""
   echo -e "\t-a can be stg or prd or cmr, to idenity link is for prod or stage or customer environment"
   echo -e "\t-b devid or cmrid, any one is acceptable subject type of env selected, .i.e. for cmr env only cmrid will be accepted"
   echo ""
   echo -e "\tFinal results would be"
   echo -e "\t Step 1:"
   echo -e "\t\t[production|staging|customer].[APAC|EMEA|AMER].[developerID|customerID].[randomString]"
   echo ""
   echo -e "\t\t prd.apac.d1234.$randomString"
   echo -e "\t\t OR "
   echo -e "\t\t cmr.apac.c1234.$randomString"
   echo ""
   echo -e "\t Step 2:"
   echo -e "\t\tStoring the Data for Future Reference"
   echo -e "\t\tFile - /tmp/urlinfo.txt"
   echo ""
   echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
   exit 1 # Exit script after printing help
}

while getopts "a:b:c:" opt
do
   case "$opt" in
      a ) parameterA="$OPTARG" ;;
      b ) parameterB="$OPTARG" ;;
      c ) parameterC="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

echo "URL String Generation  Process Started at $(date)"

# Print helpFunction in case parameters are empty
if [ -z "$parameterA" ];
then
   echo "Type of environment [stg or prd or cmr] is not provided, the parameter -a is empty";
   helpFunction
fi

# Print helpFunction in case parameters are empty
if [ -z "$parameterB" ];
then
   echo "Type of region [apac or emea or amer] is not provided, the parameter -b is empty";
   helpFunction
fi

if [ -z "$parameterC" ];
then
   echo "Type of id .i.e. [developerID or customerID] is not provided, the parameter -c is empty";
   helpFunction
fi


#checking provided input for $parameterA
chkparamA1=$(echo $parameterA | egrep -i "stg|prd")
if [ -z $chkparamA1 ];
then
	chkparamA2=$(echo $parameterA | egrep -i "cmr")
	if [ -z $chkparamA2 ];
	then
		"Correct value not provided, retry and select one from [stg|prd|cmr]"
	fi
fi

#checking provided input for $parameterB
chkparamB=$(echo $parameterB | egrep -i "apac|emea|amer")
if [ -z $chkparamB ];
then
	"Correct value not provided, retry and select one from [apac|emea|amer]"
fi

echo "Generated string is..."
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$parameterA.$parameterB.$parameterC.$randomString"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo "------- Storing the Data for Future Reference ----------"
touch /tmp/urlinfo.txt
echo "$parameterA|$parameterB|$parameterC|$randomString|$epochstamp" >> /tmp/urlinfo.txt
echo "Current entry - $(tail -1 /tmp/urlinfo.txt)"
echo ""
echo "All entries - $(tail -1 /tmp/urlinfo.txt)"
echo "" 
 
echo "URL String Generation Process completed at $(date)"
