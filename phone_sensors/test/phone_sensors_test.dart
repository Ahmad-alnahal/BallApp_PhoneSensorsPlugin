import 'package:flutter_test/flutter_test.dart';
import 'package:phone_sensors/phone_sensors.dart';
import 'package:phone_sensors/phone_sensors_platform_interface.dart';
import 'package:phone_sensors/phone_sensors_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPhoneSensorsPlatform
    with MockPlatformInterfaceMixin
    implements PhoneSensorsPlatform {
  @override
  Future<int> getNumberOfSensors() {
    // TODO: implement getNumberOfSensors
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getSensorNames() {
    // TODO: implement getSensorNames
    throw UnimplementedError();
  }
}

void main() {
  final PhoneSensorsPlatform initialPlatform = PhoneSensorsPlatform.instance;

  test('$MethodChannelPhoneSensors is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPhoneSensors>());
  });

  test('getNumberOfSensors', () async {
    PhoneSensors phoneSensorsPlugin = PhoneSensors();
    MockPhoneSensorsPlatform fakePlatform = MockPhoneSensorsPlatform();
    PhoneSensorsPlatform.instance = fakePlatform;

    expect(await phoneSensorsPlugin.getNumberOfSensors(), 0);
  });
  test('getSensorNames', () async {
    PhoneSensors phoneSensorsPlugin = PhoneSensors();
    MockPhoneSensorsPlatform fakePlatform = MockPhoneSensorsPlatform();
    PhoneSensorsPlatform.instance = fakePlatform;

    expect(await phoneSensorsPlugin.getSensorNames(), ['']);
  });
}
