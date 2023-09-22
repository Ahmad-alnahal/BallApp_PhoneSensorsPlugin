// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:phone_sensors/phone_sensors.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    final PhoneSensors plugin = PhoneSensors();
    final int? numberOfSensors = await plugin.getNumberOfSensors();
    print('<log> numberOfSensors => $numberOfSensors');
  });
  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    final PhoneSensors plugin = PhoneSensors();
    final List<String> sensorNames = await plugin.getSensorNames();
    print('<log> sensorNames => $sensorNames');
  });
}
