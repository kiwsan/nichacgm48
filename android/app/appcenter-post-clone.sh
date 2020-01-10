#!/usr/bin/env bash
# place this script in project/android/app/
cd ..
# fail if any command fails
set -e
# debug log
set -x

cd app

curl -H 'Authorization: token $GITHUB_TOKEN' -H 'Accept: application/vnd.github.v3.raw' -O -L $KEY_STORE_FILE

ls

cd ..

ls

cd ..

ls

# choose a different release channel if you want - https://github.com/flutter/flutter/wiki/Flutter-build-release-channels
# stable - recommended for production

git clone -b stable https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor

echo "Installed flutter to `pwd`/flutter"

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

# Android signing
echo storePassword=$APPCENTER_KEYSTORE_PASSWORD > android/key.properties
echo keyPassword=$APPCENTER_KEY_PASSWORD >> android/key.properties
echo keyAlias=$APPCENTER_KEY_ALIAS >> android/key.properties
echo storeFile=$APPCENTER_KEYSTORE_FILE >> android/key.properties

# build APK
 flutter build apk --release

# copy the APK where AppCenter will find it
mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/apk/release/app-release.apk $_

fi
