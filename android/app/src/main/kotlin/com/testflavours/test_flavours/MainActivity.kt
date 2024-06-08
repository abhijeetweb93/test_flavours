package com.testflavours.test_flavours
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity()  {


    private val CHANNEL = "flavor_channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getFlavor" -> {
                    result.success(BuildConfig.FLAVOR)
                }
            }
        }
    }
}
