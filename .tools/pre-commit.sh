PROJECT=$(dirname $(dirname $(dirname $0)))
STAGED_FILES_CMD=`git diff --cached --name-only --diff-filter=ACMR HEAD | grep \\\\.php`

# Determine if a file list is passed
if [ "$#" -eq 1 ]
then
 oIFS=$IFS
 IFS='
 '
 SFILES="$1"
 IFS=$oIFS
fi
SFILES=${SFILES:-$STAGED_FILES_CMD}
 echo "Checking PHP Lint (php -l) ..."
for FILE in $SFILES
do
 php -l -d display_errors=1 $PROJECT/$FILE
 if [ $? != 0 ]
 then
   echo "---------------------------------------------------"
   echo "! Fix the error before commit."
   echo "---------------------------------------------------"
   exit 1
 fi
 FILES="$FILES $PROJECT/$FILE"
done

if [ "$FILES" != "" ]
then
 echo "Running Code Sniffer (phpcs) ..."
./vendor/bin/phpcs --colors -n -p $FILES
 if [ $? != 0 ]
 then
   echo "---------------------------------------------------"
   echo "! Fix the error before commit."
   echo "! You can do this automatically with"
   echo "! ./vendor/bin/phpcbf [FILE]"
   echo "---------------------------------------------------"
   exit 1
 fi
fi

exit $?
