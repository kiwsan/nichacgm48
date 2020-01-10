#!/usr/bin/env bash

# Android Firebase
GOOGLE_JSON_FILE=android/app/google-services.json

touch $GOOGLE_JSON_FILE

echo "GoogleJson"
echo "GoogleJson $APPCENTER_SOURCE_DIRECTORY"

if [ -e "$GOOGLE_JSON_FILE" ]
then
echo "Updating Google Json"
echo "$GOOGLE_JSON" > $GOOGLE_JSON_FILE
sed -i -e 's/\\"/'\"'/g' $GOOGLE_JSON_FILE
echo "File updated"

# Example: Change bundle name of an iOS app for non-production
if [ "$APPCENTER_BRANCH" != "master" ];
then
    echo "appcenter-pre-build.sh"
fi
