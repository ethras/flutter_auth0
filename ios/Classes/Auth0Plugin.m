#import "Auth0Plugin.h"
#import <auth0/auth0-Swift.h>

@implementation Auth0Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAuth0Plugin registerWithRegistrar:registrar];
}
@end
