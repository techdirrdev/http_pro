import 'package:flutter_test/flutter_test.dart';
import 'package:http_pro/http_pro.dart';
import 'package:http_pro/http_pro_platform_interface.dart';
import 'package:http_pro/http_pro_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHttpProPlatform
    with MockPlatformInterfaceMixin
    implements HttpProPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HttpProPlatform initialPlatform = HttpProPlatform.instance;

  test('$MethodChannelHttpPro is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHttpPro>());
  });

  test('getPlatformVersion', () async {
    HttpPro httpProPlugin = HttpPro();
    MockHttpProPlatform fakePlatform = MockHttpProPlatform();
    HttpProPlatform.instance = fakePlatform;

    expect(await httpProPlugin.getPlatformVersion(), '42');
  });
}
