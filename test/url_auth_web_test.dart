import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_auth_web/url_auth_web.dart';
import 'package:url_auth_web/url_auth_web_method_channel.dart';
import 'package:url_auth_web/url_auth_web_platform_interface.dart';

class MockUrlAuthWebPlatform
    with MockPlatformInterfaceMixin
    implements UrlAuthWebPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<Map<String, dynamic>> getQueryParams() async {
    return {'value': '42'};
  }

  @override
  Future<void> launch(String url,
      {String? features, String name = "_blank"}) async {}
}

void main() {
  final UrlAuthWebPlatform initialPlatform = UrlAuthWebPlatform.instance;

  test('$MethodChannelUrlAuthWeb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUrlAuthWeb>());
  });

  test('getPlatformVersion', () async {
    UrlAuthWeb urlAuthWebPlugin = UrlAuthWeb();
    MockUrlAuthWebPlatform fakePlatform = MockUrlAuthWebPlatform();
    UrlAuthWebPlatform.instance = fakePlatform;

    expect(await urlAuthWebPlugin.getPlatformVersion(), '42');
  });

  test('launch', () async {
    UrlAuthWeb urlAuthWebPlugin = UrlAuthWeb();
    MockUrlAuthWebPlatform fakePlatform = MockUrlAuthWebPlatform();
    UrlAuthWebPlatform.instance = fakePlatform;

    await urlAuthWebPlugin.launch('https://example.com');
  });

  test('getQueryParams', () async {
    UrlAuthWeb urlAuthWebPlugin = UrlAuthWeb();
    MockUrlAuthWebPlatform fakePlatform = MockUrlAuthWebPlatform();
    UrlAuthWebPlatform.instance = fakePlatform;

    expect(await urlAuthWebPlugin.getQueryParams(), {'value': '42'});
  });
}
