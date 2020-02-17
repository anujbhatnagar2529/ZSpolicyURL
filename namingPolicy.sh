#!/bin/bash

#Generate Linux based time stamp
epochstamp=$(date +%s)

#Generate uniq string
randomString=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)

helpFunction()
{
   echo ""
   echo -e "\t Possible ways to call the utility..."
   echo ""
   echo -e "\t ---------------------------------------"
   echo -e "\t For Staging and Production Environment-"
   echo -e "\t Usage: $0 -a [stg|prd] -b [devid]"
   echo -e "\t "
   echo -e "\t For Client Environment-"
   echo -e "\t Usage: $0 -a [cmr] -b [cmrid]"
   echo -e "\t ---------------------------------------"
   echo ""
   echo -e "\t-a can be stg or prd or cmr, to idenity link is for prod or stage or customer environment"
   echo -e "\t-b devid or cmrid, any one is acceptable subject type of env selected, .i.e. for cmr env only cmrid will be accepted"
   echo ""
   echo -e "\tFinal results would be"
   echo -e "\t Step 1:"
   echo -e "\t\tproduction|staging|customer.developerID|customerID.randomString"
   echo ""
   echo -e "\t\t prd.dx1234.$randomString"
   echo -e "\t\t OR "
   echo -e "\t\t cmr.cx1234.$randomString"
   echo ""
   echo -e "\t Step 2:"
   echo -e "\t\tStoring the Data for Future Reference"
   echo -e "\t\tFile - /tmp/urlinfo.txt"
   
   exit 1 # Exit script after printing help
}

while getopts "a:b:" opt
do
   case "$opt" in
      a ) parameterA="$OPTARG" ;;
      b ) parameterB="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

echo "URL String Generation  Process Started at $(date)"

# Print helpFunction in case parameters are empty
if [ -z "$parameterA" ];
then
   echo "Type of environment is not provided, the parameter -a is empty";
   helpFunction
fi

if [ -z "$parameterB" ];
then
   echo "Type of id is not provided, the parameter -b is empty";
   helpFunction
fi
# Begin script in case all parameters are correct
echo "$parameterA.$parameterB"  

# Check whether first character is denoting customer or developer
echo "${parameterB::2}" | egrep -c cx
if [ $? -eq 0 ];
then
	echo "Processing for Developer Environment - $parameterA.$parameterB" 
fi

echo "${parameterB::2}" | egrep -c dx
if [ $? -eq 0 ];
	echo "Processing for Customer Environment - $parameterA.$parameterB" 
else
	echo "Incorrect Prefix input provided for $parameterB" 
	echo "Exiting..."
	helpFunction
fi

echo "Generated string is..."
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$parameterA.$parameterB.$randomString"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo "------- Storing the Data for Future Reference ----------"
touch /tmp/urlinfo.txt
echo "$parameterA|$parameterB|$randomString|$epochstamp >> /tmp/urlinfo.txt"
echo "Current entry - $(tail -1 /tmp/urlinfo.txt)"
echo ""
echo "All entries - $(tail -1 /tmp/urlinfo.txt)"
echo "" 
 
echo "URL String Generation Process completed at $(date)"
