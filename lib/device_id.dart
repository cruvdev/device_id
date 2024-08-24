import 'package:device_id/device_id_platform_interface.dart';

class DeviceId {
  Future<String?> getPlatformVersion() {
    return DeviceIdPlatform.instance.getPlatformVersion();
  }

  Future<String?> getDeviceId() {
    return DeviceIdPlatform.instance.getDeviceId();
  }
}
