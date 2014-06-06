//
// DeviceInfo.h
//
// Code based on Countly SDK source: https://github.com/Countly/countly-sdk-ios
//
// Modified by Ahmed Hamdy.
//
// This code is provided under the MIT License.
//
// Please visit www.count.ly for more information.

#import "DeviceInfo.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation DeviceInfo

+ (NSString *)device
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *)osVersion
{
	return [[UIDevice currentDevice] systemVersion];
}

+ (NSString*)os
{
	return @"iOS";
}

+ (NSString *)carrier
{
	if (NSClassFromString(@"CTTelephonyNetworkInfo"))
	{
		CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
		CTCarrier *carrier = [netinfo subscriberCellularProvider];
		return [carrier carrierName];
	}
	
	return nil;
}

+ (id)carrierOrNULL
{
	id ret = [DeviceInfo carrier];
	
	if (ret == nil) {
		ret = [NSNull null];
	}
	return  ret;
}

+ (NSString *)resolution
{
	CGRect bounds = [[UIScreen mainScreen] bounds];
	CGFloat scale = [[UIScreen mainScreen] respondsToSelector:@selector(scale)] ? [[UIScreen mainScreen] scale] : 1.f;
	CGSize res = CGSizeMake(bounds.size.width * scale, bounds.size.height * scale);
	NSString *result = [NSString stringWithFormat:@"%gx%g", res.width, res.height];
	
	return result;
}

+ (NSString *)locale
{
	return [[NSLocale currentLocale] localeIdentifier];
}
+ (NSString *)language
{
	return [[NSLocale preferredLanguages] firstObject];;
}
+ (NSString *)appVersion
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
}

+ (NSNumber *)timestamp
{
	return [NSNumber numberWithLong:time(NULL)];
}
+ (NSString*)batteryLevel
{
    float batteryLevel = [UIDevice currentDevice].batteryLevel;
    if (batteryLevel < 0.0) {
        // -1.0 means battery state is UIDeviceBatteryStateUnknown
        return NSLocalizedString(@"Unknown", @"");
    }
    else {
        static NSNumberFormatter *numberFormatter = nil;
        if (numberFormatter == nil) {
            numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setNumberStyle:NSNumberFormatterPercentStyle];
            [numberFormatter setMaximumFractionDigits:1];
        }
        
        NSNumber *levelObj = [NSNumber numberWithFloat:batteryLevel];
        return [numberFormatter stringFromNumber:levelObj];
    }
}

+ (NSString *)batteryState
{
    NSString*state=@"";
    UIDeviceBatteryState currentState = [UIDevice currentDevice].batteryState;
    switch (currentState) {
        case UIDeviceBatteryStateUnplugged:
            state= @"on battery, discharging";
        case UIDeviceBatteryStateCharging:
            state= @"plugged in, less than 100%";
        case UIDeviceBatteryStateFull:
            state= @"plugged in, at 100%";
        default:
            state= @"BatteryStateUnknown";
}
    return state;
}
+ (NSString*)orientation{
    NSString*orientationState=@"";
    UIDeviceOrientation currentOrientation = [UIDevice currentDevice].orientation;
    switch (currentOrientation) {
        case UIDeviceOrientationPortrait:
            orientationState= @"UIDeviceOrientationPortrait";
        case UIDeviceOrientationPortraitUpsideDown:
            orientationState= @"UIDeviceOrientationPortraitUpsideDown";
        case UIDeviceOrientationLandscapeLeft:
            orientationState= @"UIDeviceOrientationLandscapeLeft";
        case UIDeviceOrientationLandscapeRight:
            orientationState= @"UIDeviceOrientationLandscapeRight";
        case UIDeviceOrientationFaceUp:
            orientationState= @"UIDeviceOrientationFaceUp";
        case UIDeviceOrientationFaceDown:
            orientationState= @"UIDeviceOrientationFaceDown";
        default:
            orientationState= @"UIDeviceOrientationUnknown";
    }
    return orientationState;
}
+ (NSString *)currentWifiHotSpotName {
    
    NSString *wifiName = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        
        NSLog(@"info:%@",info);
        
        if (info[@"SSID"]) {
            wifiName = info[@"SSID"];
        }
    }
    return wifiName;
}

@end
