import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'http_pro_platform_interface.dart';

/// An implementation of [HttpProPlatform] that uses method channels.
class MethodChannelHttpPro extends HttpProPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('http_pro');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
