# Device ID

[![Pub Version](https://img.shields.io/pub/v/device_id)](https://pub.dartlang.org/packages/device_id)

Flutter plugin for getting device id.

## Installing

Add following dependencies to your pubspec.yaml:

```yaml
dependencies:
  device_id: ^1.0.0 #latest version
```

## Usage

Add following import to your code:

```dart
import 'package:device_id/device_id.dart';
```

Then you can use the following code to get the device id:

```dart
String _identifier = 'Unknown';
  
@override
void initState() {
  super.initState();
  initUniqueIdentifierState();
}

Future<void> initUniqueIdentifierState() async {
  String identifier;

  try {
    identifier = await _deviceIdPlugin.getDeviceId() ??
      'Unknown device id';
  } on PlatformException {
    identifier = 'Failed to get device id.';
  }

  if (!mounted) return;

  setState(() {
    _identifier = identifier;
  });
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Device ID App'),
      ),
      body: Center(
        child: Text('Device ID: $_identifier'),
      ),
    ),
  );
}
```

## License

[MIT License](https://github.com/cruvdev/device_id/blob/master/LICENSE)
