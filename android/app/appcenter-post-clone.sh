#!/usr/bin/env bash
# place this script in project/android/app/
cd ..
# fail if any command fails
set -e
# debug log
set -x

cd ..

curl -H 'Authorization: token $GITHUB_TOKEN' -H 'Accept: application/vnd.github.v3.raw' -O -L $KEY_STORE_FILE

# choose a different release channel if you want - https://github.com/flutter/flutter/wiki/Flutter-build-release-channels
# stable - recommended for production

git clone -b stable https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor

echo "Installed flutter to `pwd`/flutter"

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

# build APK
flutter build apk --release

# build an app bundle
flutter build appbundle --release

# copy the an app bundle where AppCenter will find it
mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/bundle/release/app-release.aab $_

fi
