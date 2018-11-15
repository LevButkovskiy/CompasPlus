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
@property (nonatomic, copy) void (^blockName)(NSDictionary *json, NSError *error);
//@property (nonatomic, strong) BLAPI *requestData2;
+ (BLAPI *)sharedInstance;

- (void)requestDataWithOnPage:(NSNumber *)page perPage:(NSNumber *)per_page;
- (void)processDictionaryWithJson:(NSDictionary *)json andError:(NSError *)error;
- (NSString *)setUrlWithPage:(NSNumber *)page perpage:(NSNumber *)perpage;

@end

NS_ASSUME_NONNULL_END
