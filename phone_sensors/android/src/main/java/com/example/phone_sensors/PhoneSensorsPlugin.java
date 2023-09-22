package com.example.phone_sensors;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class PhoneSensorsPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
  private MethodChannel channel;
  private SensorManager sensorManager;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "phone_sensors");
    channel.setMethodCallHandler(this);
    Context context = flutterPluginBinding.getApplicationContext();
    sensorManager = (SensorManager) context.getSystemService(Context.SENSOR_SERVICE);
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "phone_sensors");
    PhoneSensorsPlugin plugin = new PhoneSensorsPlugin();
    plugin.channel = channel;
    plugin.sensorManager = (SensorManager) registrar.activeContext().getSystemService(Context.SENSOR_SERVICE);
    channel.setMethodCallHandler(plugin);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
    if (call.method.equals("getNumberOfSensors")) {
      int numberOfSensors = sensorManager.getSensorList(Sensor.TYPE_ALL).size();
      result.success(numberOfSensors);
    } else if (call.method.equals("getSensorNames")) {
      List<Sensor> sensors = sensorManager.getSensorList(Sensor.TYPE_ALL);
      List<String> sensorNames = new ArrayList<>();
      for (Sensor sensor : sensors) {
        sensorNames.add(sensor.getName());
      }
      result.success(sensorNames);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
