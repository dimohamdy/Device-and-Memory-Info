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


//
#import <Foundation/Foundation.h>

@interface DeviceInfo : NSObject
{
}

// Access given information about the device:
+ (NSString *)device;
+ (NSString *)osVersion;
+ (NSString*)os;
+ (NSString *)carrier;
+ (id)carrierOrNULL;
+ (NSString *)resolution;
+ (NSString *)locale;
+ (NSString *)language;
+ (NSString *)appVersion;
+ (NSNumber *)timestamp; //unix timestamp
+ (NSString*)batteryLevel;
+ (NSString *)batteryState;
+ (NSString*)orientation;
+ (NSString *)currentWifiHotSpotName;

@end
