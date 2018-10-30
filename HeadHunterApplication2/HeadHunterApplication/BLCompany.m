//
//  BLCompany.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 19/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLCompany.h"
@implementation BLCompany

//Elements initialization
- (id)initWithString:(NSString *)newName andID:(int)newID{
    if(self = [super init]){
  //   self = [super init];
        _Name = newName;
        _ID = newID;
    }
    return self;
}

- (void)sayHello {
    NSLog(@"Hello, World!");
}

@end
