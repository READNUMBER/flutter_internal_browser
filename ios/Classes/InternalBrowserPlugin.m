#import "InternalBrowserPlugin.h"
#if __has_include(<internal_browser/internal_browser-Swift.h>)
#import <internal_browser/internal_browser-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "internal_browser-Swift.h"
#endif

@implementation InternalBrowserPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInternalBrowserPlugin registerWithRegistrar:registrar];
}
@end
