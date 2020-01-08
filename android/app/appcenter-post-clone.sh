#!/usr/bin/env bash
# place this script in project/android/app/
cd ..
# fail if any command fails
set -e
# debug log
set -x

cd ..

wget --header='Accept: application/vnd.github.v3.raw' https://api.github.com/repos/kiwsan/nichacgm48/contents/android/app/keep/android.keystore

ls android/app/

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

# copy the APK where AppCenter will find it
mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/apk/release/app-release.apk $_

# copy the an app bundle where AppCenter will find it
mkdir -p android/app/build/outputs/bundle/; mv build/app/outputs/bundle/release/app-release.aab $_

fi
