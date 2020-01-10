if [ "$AGENT_JOBSTATUS" == "Succeeded" ]; then

    # Example: Upload master branch app binary to HockeyApp using the API
    if [ "$APPCENTER_BRANCH" == "master" ];
     then
        echo "Upload APK into Play Store"
    else
        echo "Current branch is $APPCENTER_BRANCH"
    fi
fi
