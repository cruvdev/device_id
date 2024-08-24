import Flutter
import UIKit

public class DeviceIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_id", binaryMessenger: registrar.messenger())
    let instance = DeviceIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getDeviceId":
      result(UIDevice.current.identifierForVendor?.uuidString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
