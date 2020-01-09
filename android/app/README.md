We’re going to make some simple shell scripts to build the app and run tests, to keep our Fastfile clean.

```bash
$ touch android/fastlane/flutter_build.sh
```

```bash
touch android/fastlane/flutter_test.sh
```

```bash
chmod a+x android/fastlane/flutter_build.sh
```

```bash
chmod a+x android/fastlane/flutter_test.sh
```

You can use these lanes as demonstrated below:

Build the release binaries:
```bash
bundle exec fastlane build_android
```

Production deploy:
```bash
bundle exec fastlane deploy_android production:true
```

Beta deploy:
```bash
bundle exec fastlane deploy_android beta:true
```

Alpha deploy:
```bash
bundle exec fastlane deploy_android alpha:true
```

Internal track deploy:
```bash
bundle exec fastlane deploy_android internal:true
```

## Resource
- https://appditto.com/blog/automate-your-flutter-workflow
