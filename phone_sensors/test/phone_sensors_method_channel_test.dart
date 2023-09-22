import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phone_sensors/phone_sensors_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelPhoneSensors platform = MethodChannelPhoneSensors();
  const MethodChannel channel = MethodChannel('phone_sensors');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getSensorNames', () async {
    expect(await platform.getSensorNames(), ['']);
  });
  test('getNumberOfSensors', () async {
    expect(await platform.getNumberOfSensors(), 0);
  });
}
