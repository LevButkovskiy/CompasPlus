//
//  BLSingleton.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 06/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLSingleton.h"

@implementation BLSingleton

static BLSingleton *sharedBLSingleton = nil;

+ (BLSingleton *)sharedInstance{
    if(sharedBLSingleton == nil){
        sharedBLSingleton = [[BLSingleton alloc]init];
    }
    return sharedBLSingleton;
}

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
 //   return [[self sharedInstance] retain];
}

- (id) copyWithZone:(NSZone*)zone
{
    return self;
}
//retain error
/*- (id) retain
{
    return self;
}

- (NSUInteger) retainCount
{
    return NSUIntegerMax; //max number
}

- (void) release { }

- (id) autorelease
{
    return self;
}*/

- (void)requestData
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *baseURL = [NSURL URLWithString:@"https://api.hh.ru/employers"];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error :<%@>", [error.userInfo objectForKey:NSLocalizedDescriptionKey]);
        } else {
            
            NSError *error;
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (error) {
                NSLog(@"error :<%@>", [error.userInfo objectForKey:NSLocalizedDescriptionKey]);
            } else {
                NSLog(@"=:\n%@", json);
                if ([json isKindOfClass:[NSDictionary class]]) {
                    [self processDictionary:(NSDictionary *)json];
                } else if ([json isKindOfClass:[NSArray class]]) {
                    [self processArray:json];
                } else {
                    NSLog(@"непонятный класс");
                }
            }
            
        }
    }];
    
    [dataTask resume];
    
}

- (void)processDictionary:(NSDictionary *)json /*and ...*/
{
    BLPages *pages = [[BLPages alloc]initWithDictionary:json]; //Class initialization "BLPages"
    pages.nextPage; //incrementing number of page
    NSLog(@"numberThisPage: <%@>", pages.numberThisPage);
    NSNumber *thisPage = [json objectForKey:@"page"]; //thisPage - number of this page in json
    thisPage = pages.numberThisPage; //this page - incremented value of page number in json
    [json setValue:thisPage forKey:@"page"]; //check set value for json
    NSArray *items = [json objectForKey:@"items"];
    /* NSInteger *i;
     for(i in pages){
     count = [NSNumber numberWithInt:i];
     //  i++;*/
    //   for(page in pages){
    for (NSDictionary *item in items) {
        BLCompany *company = [[BLCompany alloc] initWithDictionary:item];
        NSLog(@"add company:<%@>", company); // add company: <Имя>:<ID>
        [_companies addObject:company];
    }
    NSLog(@"");
}

- (void)processArray:(NSArray *)json
{
    
}
@end

