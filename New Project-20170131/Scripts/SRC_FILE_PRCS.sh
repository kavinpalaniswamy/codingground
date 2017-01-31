#!/bin/bash
SRC_DIR=/home/cg/root/Datafiles
TIF_DIR=/home/cg/root/Tifs
logname=/home/cg/root/Log/SRC_FILE_PRCS`date +%Y%m%d%H%M%S`

#############################################
# BEGINNING OF LOGFILE FUNCTIONS DEFINITION #
#############################################

function _logMsg
{
echo `date +"%m-%d-%Y %T %Z"`:$* >> $logname.log

_logMsg "Variables values for current run>>>>>>>>"
_logMsg "TIF File location : $TIF_DIR"
_logMsg "SRC File location : $SRC_DIR"

LIST_CLEAN_FILE='ls -1 CDT_NAVCP_EyeMed_CLEAN_* '
echo $LIST_CLEAN_FILE > CLEAN_FILE.lst

_logMsg "List file created with all the Clean files in the source directory"

LIST_RISK_FILE='ls -1 CDT_NAVCP_EyeMed_RISK_* '
echo $LIST_RISK_FILE > RISK_FILE.lst

_logMsg "List file created with all the Risk files in the source directory"

cd SRC_DIR

_logMsg "Directory changed to Inbound source directory"

#--------------------------------------------------------------------------------------------#
# Process single or multiple Clean files.													 #
#--------------------------------------------------------------------------------------------#

_logMsg "For loop to process multiple files started"

for cleandata in `CLEAN_FILE.lst`
do
_logMsg "Record is: $cleandata"

CLEAN_FILE_DT=CLEAN_`ls $cleandata | awk -F'[_.]' '{print $4"_"$5}'`

_logMsg "Current Clean file date is: $CLEAN_FILE_DT"

unzip $cleandata -d $SRC_DIR

_logMsg "Clean files successfully unzipped to source directory"

rename .txt _$CLEAN_FILE_DT.txt *.txt

_logMsg "All .txt files appened with CLEAN_date"

mv *.TIF $TIF_DIR

_logMsg "*.TIF files moved to TIF location"

done

##rm CLEAN_FILE.lst

_logMsg "Clean list file used for processing the multiple source files was removed."


#--------------------------------------------------------------------------------------------#
# Process single or multiple Risk files.													 #
#--------------------------------------------------------------------------------------------#

for riskdata in `RISK_FILE.lst`
do
_logMsg "Record is: $riskdata"

RISK_FILE_DT=RISK_`ls $riskdata | awk -F'[_.]' '{print $4"_"$5}'`

_logMsg "Current Risk file date is: $RISK_FILE_DT"

unzip $riskdata -d $SRC_DIR

_logMsg "Risk files successfully unzipped to source directory"

rename .txt _$RISK_FILE_DT.txt *.txt

_logMsg "All .txt files appened with RISK_date"

mv *.TIF $TIF_DIR

_logMsg "*.TIF files moved to TIF location"

done

##rm RISK_FILE.lst

##_logMsg "Risk list file used for processing the multiple source files was removed."


#--------------------------------------------------------------------------------------------#
# List file creation for Clean & Risk files													 #
#--------------------------------------------------------------------------------------------#

cd $SRC_DIR

FILE1='ls CDT_ACCREDITATION_* -1'
echo $FILE1 > CDT_ACCREDITATION.lst

FILE2='ls CDT_ATTEMPTS* -1'
echo $FILE2 > CDT_ATTEMPTS.lst

FILE3='ls CDT_BRD_CRT* -1'
echo $FILE3 > CDT_BRD_CRT.lst

FILE4='ls CDT_CDS* -1'
echo $FILE4 > CDT_CDS.lst

FILE5='ls CDT_CRITERIA* -1'
echo $FILE5 > CDT_CRITERIA.lst

FILE6='ls CDT_DATES* -1'
echo $FILE6 > CDT_DATES.lst

FILE7='ls CDT_DEA* -1'
echo $FILE7 > CDT_DEA.lst

FILE8='ls CDT_EDUCATION* -1'
echo $FILE8 > CDT_EDUCATION.lst

FILE9='ls CDT_HOSPITAL* -1'
echo $FILE9 > CDT_HOSPITAL.lst

FILE10='ls CDT_LANGUAGES* -1'
echo $FILE10 > CDT_LANGUAGES.lst

FILE11='ls CDT_HOSPITAL* -1'
echo $FILE11 > CDT_HOSPITAL.lst

FILE12='ls CDT_MEDICAID* -1'
echo $FILE12 > CDT_MEDICAID.lst

FILE12='ls CDT_OFFICE* -1'
echo $FILE12 > CDT_OFFICE.lst

FILE13='ls CDT_PLI* -1'
echo $FILE13 > CDT_PLI.lst

FILE14='ls CDT_PRIMARY* -1'
echo $FILE14 > CDT_PRIMARY.lst

FILE15='ls CDT_PRODUCT* -1'
echo $FILE15 > CDT_PRODUCT.lst

FILE16='ls CDT_QUERIES* -1'
echo $FILE16 > CDT_QUERIES.lst

FILE17='ls CDT_SANCTION* -1'
echo $FILE17 > CDT_SANCTION.lst

FILE18='ls CDT_SITES* -1'
echo $FILE18 > CDT_SITES.lst

FILE19='ls CDT_STATE_LIC* -1'
echo $FILE19 > CDT_STATE_LIC.lst

FILE20='ls CDT_STUDY* -1'
echo $FILE20 > CDT_STUDY.lst

FILE21='ls CDT_WORK_HISTORY* -1'
echo $FILE21 > CDT_WORK_HISTORY.lst

_logMsg "List file created successfully"