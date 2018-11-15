//
//  ViewController.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 19/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *_companies;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    //Initialization Company(-es)
    
    [super viewDidLoad];

    _companies = @[].mutableCopy; //[[NSMutableArray alloc] initWithCapacity:0];
    [self requestData];
    BLAPI Data = [[BLAPI alloc]init];
}

- (void)load
{
    [self viewDidLoad];
}

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

- (void)processDictionary:(NSDictionary *)json
{
    NSArray *items = [json objectForKey:@"items"];
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
