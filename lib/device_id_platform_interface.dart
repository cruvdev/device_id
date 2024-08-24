import 'package:device_id/device_id_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class DeviceIdPlatform extends PlatformInterface {
  /// Constructs a DeviceIdPlatform.
  DeviceIdPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceIdPlatform _instance = MethodChannelDeviceId();

  /// The default instance of [DeviceIdPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceId].
  static DeviceIdPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceIdPlatform] when
  /// they register themselves.
  static set instance(DeviceIdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getDeviceId() {
    throw UnimplementedError('getDeviceId() has not been implemented.');
  }
}
