//
//  NSProcessInfo+OSVersionCompat.m
//  YNMOSVersionCompat
//
//  Created by yanamura on 2014/10/21.
//  Copyright (c) 2014年 Yasuharu Yanamura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSProcessInfo+OSVersionCompat.h"

@interface NSProcessInfo_OSVersionCompat : XCTestCase

@end

@implementation NSProcessInfo_OSVersionCompat

- (void)testHigerVersion {
    if ([[[UIDevice currentDevice] systemVersion] isEqualToString:@"8.0"]) {
        BOOL result = [[NSProcessInfo processInfo] ynm_isOperatingSystemAtLeastVersion:YNMOSVersionMake(7,0)];
        XCTAssertTrue(result);
    }

    if ([[[UIDevice currentDevice] systemVersion] isEqualToString:@"7.1"]) {
        BOOL result = [[NSProcessInfo processInfo] ynm_isOperatingSystemAtLeastVersion:YNMOSVersionMake(6,1)];
        XCTAssertTrue(result);

        result = [[NSProcessInfo processInfo] ynm_isOperatingSystemAtLeastVersion:YNMOSVersionMake(7,0)];
        XCTAssertTrue(result);
    }
}

- (void)testLowerVersion {
    if ([[[UIDevice currentDevice] systemVersion] isEqualToString:@"8.0"]) {
        BOOL result = [[NSProcessInfo processInfo] ynm_isOperatingSystemAtLeastVersion:YNMOSVersionMake(9,0)];
        XCTAssertFalse(result);

        result = [[NSProcessInfo processInfo] ynm_isOperatingSystemAtLeastVersion:YNMOSVersionMake(8,1)];
        XCTAssertFalse(result);
    }

    if ([[[UIDevice currentDevice] systemVersion] isEqualToString:@"7.1"]) {
        BOOL result = [[NSProcessInfo processInfo] ynm_isOperatingSystemAtLeastVersion:YNMOSVersionMake(8,0)];
        XCTAssertFalse(result);

        result = [[NSProcessInfo processInfo] ynm_isOperatingSystemAtLeastVersion:YNMOSVersionMake(7,2)];
        XCTAssertFalse(result);
    }
}

- (void)testSameVersion {
    if ([[[UIDevice currentDevice] systemVersion] isEqualToString:@"8.0"]) {
        BOOL result = [[NSProcessInfo processInfo] ynm_isOperatingSystemAtLeastVersion:YNMOSVersionMake(8,0)];
        XCTAssertTrue(result);
    }

    if ([[[UIDevice currentDevice] systemVersion] isEqualToString:@"7.1"]) {
        BOOL result = [[NSProcessInfo processInfo] ynm_isOperatingSystemAtLeastVersion:YNMOSVersionMake(7,1)];
        XCTAssertTrue(result);
    }
}

@end
