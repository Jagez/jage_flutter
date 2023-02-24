package com.jage.jage_app;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.os.Bundle;
import android.os.Build;

import android.view.View;
import android.view.WindowManager;

// class MainActivity: FlutterActivity() {

// }

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            //设置透明顶部状态栏
            getWindow().setStatusBarColor(0);
            //！！！全屏会导致软键盘无法弹起
            //全屏，即隐藏状态栏
            //getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
            //显示状态栏
            //getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        //    getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
        //            | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        }
    }
}