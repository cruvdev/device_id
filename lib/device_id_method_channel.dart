import 'package:device_id/device_id_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [DeviceIdPlatform] that uses method channels.
class MethodChannelDeviceId extends DeviceIdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_id');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getDeviceId() async {
    final identifier = await methodChannel.invokeMethod<String>('getDeviceId');
    return identifier;
  }
}
