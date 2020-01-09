# touch android/fastlane/flutter_build.sh
# touch android/fastlane/flutter_test.sh
# chmod a+x android/fastlane/flutter_build.sh
# chmod a+x android/fastlane/flutter_test.sh

Build the release binaries:
# bundle exec fastlane build_android
Production deploy:
# bundle exec fastlane deploy_android production:true
Beta deploy:
# bundle exec fastlane deploy_android beta:true
Alpha deploy:
# bundle exec fastlane deploy_android alpha:true
Internal track deploy:
# bundle exec fastlane deploy_android internal:true

## Resource
- https://appditto.com/blog/automate-your-flutter-workflow
