package com.jukqaz.internal_browser

import android.app.Activity
import android.content.ActivityNotFoundException
import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import androidx.browser.customtabs.CustomTabsIntent
import android.net.Uri
import android.graphics.Color

public class InternalBrowserPlugin(
    private val activity: Activity
) : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "internal_browser")
            channel.setMethodCallHandler(InternalBrowserPlugin(registrar.activity()))
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "open") {
            try {
                val intent = CustomTabsIntent.Builder()
                    .setToolbarColor(Color.parseColor("#2962ff"))
                    .build()
                intent.launchUrl(activity, Uri.parse(call.arguments as String))
                result.success(null)
            } catch (e: ActivityNotFoundException) {
                result.error("", "실행할수 있는 앱이 없습니다.", null)
            }
        } else {
            result.notImplemented()
        }
    }
}
