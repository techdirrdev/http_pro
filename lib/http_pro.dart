import 'http_pro_platform_interface.dart';

class HttpPro {
  Future<String?> getPlatformVersion() {
    return HttpProPlatform.instance.getPlatformVersion();
  }
}
