package com.testproj2;

import android.util.Log;
import android.widget.Toast;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class LivenessModule extends ReactContextBaseJavaModule {

    ReactApplicationContext reactContext;
    LivenessModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext=reactContext;
    }

    @ReactMethod
    public void goToNative(){
        Log.i("LivenessModule", "livenessView ran");
    }

    @NonNull
    @Override
    public String getName() {
        return "Connect";
    }
}
