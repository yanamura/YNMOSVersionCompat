//
//  NSObject+NSProcessInfo_OSVersionCompat.m
//  YNMOSVersionCompat
//
//  Created by yanamura on 2014/10/21.
//  Copyright (c) 2014年 Yasuharu Yanamura. All rights reserved.
//

#import "NSProcessInfo+OSVersionCompat.h"
@import UIKit;

@implementation NSProcessInfo (OSVersionCompat)

- (BOOL)ynm_isOperatingSystemAtLeastVersion:(YNMOperatingSystemVersion)version
{
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1) {
        return [[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){
            .majorVersion = version.majorVersion,
            .minorVersion = version.minorVersion,
            .patchVersion = 0
        }];
    } else {
        NSString* currentVersion = [[UIDevice currentDevice] systemVersion];
        NSComparisonResult result = [currentVersion compare:[NSString stringWithFormat:@"%d.%d", version.majorVersion, version.minorVersion]
                                                    options:NSNumericSearch
                                     ];

        switch(result) {
            case NSOrderedSame:
                return YES;
            case NSOrderedAscending:
                return NO;
            case NSOrderedDescending:
                return YES;
        }
    }
}

@end
