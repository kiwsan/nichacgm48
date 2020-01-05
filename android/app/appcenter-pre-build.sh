#!/usr/bin/env bash
# This file is used by appcenter server in order to create google-services.json (which contains sensitive data) from
# environment variable
# Details can be found here: https://www.jimbobbennett.io/updating-your-google-service-json-from-an-appcenter-environment-variable/
# https://docs.microsoft.com/en-us/appcenter/build/custom/scripts/
GOOGLE_JSON_FILE=$APPCENTER_SOURCE_DIRECTORY/android/app/google-services.json

touch $GOOGLE_JSON_FILE

echo "GoogleJson"
echo "GoogleJson $APPCENTER_SOURCE_DIRECTORY"

if [ -e "$GOOGLE_JSON_FILE" ]
then
echo "Updating Google Json"
echo "$GOOGLE_JSON" > $GOOGLE_JSON_FILE
sed -i -e 's/\\"/'\"'/g' $GOOGLE_JSON_FILE
echo "File updated"
fi
