//
//  BLAPI.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 06/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLAPI : NSObject
//@property (nonatomic, copy) void (^result)(NSDictionary *json, NSError *error);
@property (nonatomic, strong) NSDictionary *res_json;
@property (nonatomic, strong) NSError *error;


+ (BLAPI *)sharedInstance;

- (void)requestDataForType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage;
- (NSString *)setUrlWithType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage;

@end

NS_ASSUME_NONNULL_END
