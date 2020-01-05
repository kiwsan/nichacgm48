#!/usr/bin/env bash
# This file is used by appcenter server in order to create google-services.json (which contains sensitive data) from
# environment variable
# Details can be found here: https://www.jimbobbennett.io/updating-your-google-service-json-from-an-appcenter-environment-variable/
GOOGLE_JSON_FILE=google-services.json

touch $GOOGLE_JSON_FILE

if [ -e "$GOOGLE_JSON_FILE" ]
then
echo "Updating Google Json"
echo "$GOOGLE_JSON" > $GOOGLE_JSON_FILE
sed -i -e 's/\\"/'\"'/g' $GOOGLE_JSON_FILE
echo "File updated"
fi