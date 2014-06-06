//
//  DHMemoryInfo.h
//  DeviceInfo
//
//  Created by binaryboy on 6/6/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHMemoryInfo : NSObject
vm_size_t usedMemory(void) ;
vm_size_t freeMemory(void) ;
void logMemUsage(void) ;
@end
