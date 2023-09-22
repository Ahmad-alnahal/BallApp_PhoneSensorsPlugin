import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'phone_sensors_method_channel.dart';

abstract class PhoneSensorsPlatform extends PlatformInterface {
  /// Constructs a PhoneSensorsPlatform.
  PhoneSensorsPlatform() : super(token: _token);

  static final Object _token = Object();

  static PhoneSensorsPlatform _instance = MethodChannelPhoneSensors();

  /// The default instance of [PhoneSensorsPlatform] to use.
  ///
  /// Defaults to [MethodChannelPhoneSensors].
  static PhoneSensorsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PhoneSensorsPlatform] when
  /// they register themselves.
  static set instance(PhoneSensorsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> getNumberOfSensors() async {
    return 0;
  }

  Future<List<String>> getSensorNames() async {
    return [];
  }
}
