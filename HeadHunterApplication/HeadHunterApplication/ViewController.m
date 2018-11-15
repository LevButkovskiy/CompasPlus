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
    NSDictionary *session = [BLAPI sharedInstanceWithType:@"employers" onPage:@(0) perPage:@(20)];
    [self processDictionary:session];
}
- (void)load
{
    [self viewDidLoad];
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
