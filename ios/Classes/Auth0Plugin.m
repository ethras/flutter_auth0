#import "Auth0Plugin.h"
#import <flutter_auth0/flutter_auth0-Swift.h>

@implementation Auth0Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAuth0Plugin registerWithRegistrar:registrar];
}
@end
