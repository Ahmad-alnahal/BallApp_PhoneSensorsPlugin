import 'phone_sensors_platform_interface.dart';

class PhoneSensors {
  Future<List<String>> getSensorNames() async {
    return PhoneSensorsPlatform.instance.getSensorNames();
  }

  Future<int> getNumberOfSensors() async {
    return PhoneSensorsPlatform.instance.getNumberOfSensors();
  }
}
