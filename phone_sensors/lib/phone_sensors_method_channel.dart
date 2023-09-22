import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'phone_sensors_platform_interface.dart';

/// An implementation of [PhoneSensorsPlatform] that uses method channels.
class MethodChannelPhoneSensors extends PhoneSensorsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  static const MethodChannel _channel =  MethodChannel('phone_sensors');


  @override
  Future<int> getNumberOfSensors() async {
    final int count = await _channel.invokeMethod('getNumberOfSensors');
    return count;
  }

  @override
  Future<List<String>> getSensorNames() async {
    final List<dynamic> sensorNames =
    await _channel.invokeMethod('getSensorNames');
    return sensorNames.cast<String>();
  }
}
