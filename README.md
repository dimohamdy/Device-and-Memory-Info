Device-and-Memory-Info_iOS
==========================

get Device Info and Memory Info


use DeviceInfo.m to get alot of information about user Device that can be usfaul when you want to understand the feed back from users
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


use DHMemoryInfo.m to get alot of information about user Memory  that can be usfaul when you want to understand the feed back from users
about Crashes.


vm_size_t usedMemory(void) ;
vm_size_t freeMemory(void) ;
void logMemUsage(void) ;
