//
//  BLAPI.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 06/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLAPI.h"

@implementation BLAPI

static BLAPI *dataManager = nil;
static dispatch_once_t onceToken;
+ (BLAPI *)sharedInstance
{
    dispatch_once(&onceToken, ^{
        dataManager = [[BLAPI alloc] init];
    });
    return dataManager;
}

- (void)requestDataForType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage completion:(NSDictionary* (^)(NSDictionary*, NSError*)) completion
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *baseURL = [NSURL URLWithString:[self setUrlWithType:type onPage:page perPage:perPage]];
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
                    self.res_json = json;
                    simpleBlock();
                
                }
                else {
                    NSLog(@"непонятный класс");
                }

            }
            
        }
    }];
    [dataTask resume];
}

void (^simpleBlock)(void) = ^{
    NSLog(@"This is a block");
};


- (NSString *)setUrlWithType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage{
    
    NSString *tmpString = [NSString stringWithFormat:@"%@%@%s%@%s%@", @"https://api.hh.ru/",type, "?per_page=", perPage, "&page=", page];
    return tmpString;
}

@end

