package com.kiwsan.nichacgm48

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {

        // https://docs.microsoft.com/en-us/appcenter/sdk/distribute/android

        //val appSecret = System.getenv("APPCENTER_APP_SECRET")

        //AppCenter.start(application, appSecret, Analytics::class.java, Crashes::class.java)

        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
