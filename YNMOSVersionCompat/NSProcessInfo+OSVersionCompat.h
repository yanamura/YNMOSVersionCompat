//
//  NSObject+NSProcessInfo_OSVersionCompat.h
//  YNMOSVersionCompat
//
//  Created by yanamura on 2014/10/21.
//  Copyright (c) 2014年 Yasuharu Yanamura. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    NSInteger majorVersion;
    NSInteger minorVersion;
} YNMOperatingSystemVersion;

static inline YNMOperatingSystemVersion
YNMOSVersionMake(NSInteger majorVersion, NSInteger minorVersion)
{
    YNMOperatingSystemVersion version;
    version.majorVersion = majorVersion;
    version.minorVersion = minorVersion;
    return version;
}

@interface NSProcessInfo (OSVersionCompat)

- (BOOL)ynm_isOperatingSystemAtLeastVersion:(YNMOperatingSystemVersion)version;

@end
