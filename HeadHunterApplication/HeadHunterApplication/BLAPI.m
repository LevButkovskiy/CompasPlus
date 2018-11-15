//
//  BLAPI.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 06/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLAPI.h"

@implementation BLAPI
/*void (^block) (id) = ^(NSDictionary *json, NSError *error){
    
};*/

static BLAPI *dataManager = nil;
static dispatch_once_t onceToken;
+ (BLAPI *)sharedInstance
{
    dispatch_once(&onceToken, ^{
        dataManager = [[BLAPI alloc] init];
    });
    return dataManager;
}

- (void)requestDataWithOnPage:(NSNumber *)page perPage:(NSNumber *)per_page
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *baseURL = [NSURL URLWithString:[self setUrlWithPage:page perpage:per_page]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error :<%@>", [error.userInfo objectForKey:NSLocalizedDescriptionKey]);
        } else {
            NSError *errorU;
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&errorU];
            
            if (errorU) {
                NSLog(@"error :<%@>", [errorU.userInfo objectForKey:NSLocalizedDescriptionKey]);
            } else {
                NSLog(@"=:\n%@", json);
                if ([json isKindOfClass:[NSDictionary class]]) {
                    //return json;
                    self.blockName(json, errorU);
                }
                else {
                    NSLog(@"непонятный класс");
                }

            }
            
        }
    }];
    [dataTask resume];
}

- (NSString *)setUrlWithPage:(NSNumber *)page perpage:(NSNumber *)perpage{
    
    NSString *tmpString = [NSString stringWithFormat:@"%@%@%s%@", @"https://api.hh.ru/employers?per_page=", page, "&page=", perpage];
    return tmpString;
}

@end

