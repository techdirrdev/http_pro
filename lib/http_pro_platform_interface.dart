import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'http_pro_method_channel.dart';

abstract class HttpProPlatform extends PlatformInterface {
  /// Constructs a HttpProPlatform.
  HttpProPlatform() : super(token: _token);

  static final Object _token = Object();

  static HttpProPlatform _instance = MethodChannelHttpPro();

  /// The default instance of [HttpProPlatform] to use.
  ///
  /// Defaults to [MethodChannelHttpPro].
  static HttpProPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HttpProPlatform] when
  /// they register themselves.
  static set instance(HttpProPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
