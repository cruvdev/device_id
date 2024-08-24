import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown', _deviceId = 'Unknown';
  final _deviceIdPlugin = DeviceId();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion, deviceId;

    try {
      platformVersion = await _deviceIdPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      deviceId = await _deviceIdPlugin.getDeviceId() ??
          'Unknown device id';
    } on PlatformException {
      deviceId = 'Failed to get device id.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _deviceId = deviceId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Device ID App'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableText('Running on: $_platformVersion'),
              const SizedBox(height: 10),
              SelectableText('Device ID: $_deviceId'),
            ],
          ),
        ),
      ),
    );
  }
}
