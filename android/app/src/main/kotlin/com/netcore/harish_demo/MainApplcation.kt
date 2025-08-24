package com.netcore.harish_demo

import android.app.Application
import com.netcore.android.Smartech
import com.netcore.smartech_appinbox.SmartechAppinboxPlugin
import com.netcore.smartech_base.SmartechBasePlugin
import com.netcore.smartech_push.SmartechPushPlugin
import java.lang.ref.WeakReference

class MainApplcation:Application() {
    override fun onCreate() {
        super.onCreate()

        val smartech = Smartech.getInstance(WeakReference(this))
        smartech.initializeSdk(this)
        smartech.trackAppInstallUpdateBySmartech()
        smartech.setDebugLevel(9)



        SmartechBasePlugin.initializePlugin(this)
        SmartechPushPlugin.initializePlugin(this)
        SmartechAppinboxPlugin.initializePlugin(this)



    }
}