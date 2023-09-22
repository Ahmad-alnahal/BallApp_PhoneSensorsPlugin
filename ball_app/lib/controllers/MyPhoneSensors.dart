import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:phone_sensors/phone_sensors.dart';

class MyPhoneSensors {
  MyPhoneSensors() {
    fetchSensorData();
  }
  Future<void> fetchSensorData() async {
    int numberOfSensors = await PhoneSensors().getNumberOfSensors();
    List<String> sensorNames = await PhoneSensors().getSensorNames();
    if (kDebugMode) {
      print("<log> Number of sensors => $numberOfSensors");
    }

    if (kDebugMode) {
      print("<log> Sensor names => ");
    }
    for (String sensorName in sensorNames) {
      if (kDebugMode) {
        print(sensorName);
      }
    }
  }
}
