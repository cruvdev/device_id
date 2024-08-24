import 'package:device_id/device_id_platform_interface.dart';

class DeviceId {
  const DeviceId._();

  static Future<String?> get getPlatformVersion {
    return DeviceIdPlatform.instance.getPlatformVersion();
  }

  static Future<String?> get getId {
    return DeviceIdPlatform.instance.getDeviceId();
  }
}
