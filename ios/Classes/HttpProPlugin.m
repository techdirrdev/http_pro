#import "HttpProPlugin.h"
#if __has_include(<http_pro/http_pro-Swift.h>)
#import <http_pro/http_pro-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "http_pro-Swift.h"
#endif

@implementation HttpProPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHttpProPlugin registerWithRegistrar:registrar];
}
@end
