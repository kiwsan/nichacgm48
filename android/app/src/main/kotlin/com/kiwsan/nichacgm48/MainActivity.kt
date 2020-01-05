package com.kiwsan.nichacgm48

import androidx.annotation.NonNull
import com.microsoft.appcenter.AppCenter
import com.microsoft.appcenter.analytics.Analytics
import com.microsoft.appcenter.crashes.Crashes
import com.microsoft.appcenter.distribute.Distribute
import com.microsoft.appcenter.push.Push
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {

        // https://docs.microsoft.com/en-us/appcenter/sdk/distribute/android
        Distribute.setEnabled(true)

        val appSecret = System.getenv("APPCENTER_APP_SECRET")

        AppCenter.start(application, appSecret,
                Analytics::class.java, Crashes::class.java,
                Distribute::class.java, Push::class.java)

        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
