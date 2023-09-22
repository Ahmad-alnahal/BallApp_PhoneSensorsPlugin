import Flutter
import UIKit
import CoreMotion

public class SwiftPhonesensorsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "phonesensors_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftPhonesensorsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getNumberOfSensors" {
            let motionManager = CMMotionManager()
            var numberOfSensors = 0

            if motionManager.isAccelerometerAvailable {
                numberOfSensors += 1
            }
            if motionManager.isGyroAvailable {
                numberOfSensors += 1
            }
            if motionManager.isMagnetometerAvailable {
                numberOfSensors += 1
            }
            if motionManager.isDeviceMotionAvailable {
                numberOfSensors += 1
            }

            result(numberOfSensors)
        } else if call.method == "getSensorNames" {
            let sensorNames = ["Accelerometer", "Gyroscope", "Magnetometer", "Device Motion"]
            result(sensorNames)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
