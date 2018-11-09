//
//  BLSingleton.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 06/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLSingleton : NSObject
//@property (nonatomic, strong) BLSingleton *requestData2;
+ (BLSingleton *)sharedInstance;
+ (id) allocWithZone:(NSZone *)zone;
//- (id) retain;
//- (NSUInteger) retainCount;
//- (void) release;
//- (id) autorelease;

- (void)requestData;
- (void)processDictionary:(NSDictionary *)json;
- (void)processArray:(NSDictionary *)json;
@end

NS_ASSUME_NONNULL_END
