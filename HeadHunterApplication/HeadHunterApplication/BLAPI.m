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

- (void)requestDataForType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage completion:(DataBlock)completion
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
                    completion(json, error);

                }
                else {
                    NSLog(@"непонятный класс");
                }

            }
            
        }
    }];
    [dataTask resume];
}

- (void)requestDataForType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage
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
                    self.block(json, error);
                    
                }
                else {
                    NSLog(@"непонятный класс");
                }
                
            }
            
        }
    }];
    [dataTask resume];
}

- (void)requestVacansyForCompany:(BLCompany *)company completion:(DataBlock)completion
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *baseURL = [NSURL URLWithString:[self setUrlWithEmployerId:company.ID]];
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
                    completion(json, error);
                }
                else {
                    NSLog(@"непонятный класс");
                }
                
            }
            
        }
    }];
    [dataTask resume];
}

-(void)imageWithURL:(NSString *)url completion:(ImageBlock)completion{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *imageURL = [NSURL URLWithString:url];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:imageURL
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error :<%@>", [error.userInfo objectForKey:NSLocalizedDescriptionKey]);
        } else {
            NSData * data = [NSData dataWithContentsOfURL:imageURL];
            UIImage * image = [UIImage imageWithData:data];
            completion(image, error);
        }
    }];
    [dataTask resume];
    
}


- (NSString *)setUrlWithType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage{
    
    NSString *tmpString = [NSString stringWithFormat:@"%@%@%s%@%s%@", @"https://api.hh.ru/",type, "?per_page=", perPage, "&page=", page];
    return tmpString;
}

- (NSString *)setUrlWithEmployerId:(NSString *)ID{
    
    NSString *tmpString = [NSString stringWithFormat:@"%@%@", @"https://api.hh.ru/vacancies?employer_id=", ID];
    return tmpString;
}

@end

