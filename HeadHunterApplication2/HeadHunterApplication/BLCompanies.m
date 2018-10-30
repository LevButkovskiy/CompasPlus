//
//  BLCompanies.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 25/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLCompanies.h"

@implementation BLCompanies
//Array initialization
- (id)initWithArray {
    if(self){
        self = [super init];
        _CompanyArr = [[NSMutableArray alloc] init];
    }
    return self;
}

//Adding company to array of companies
- (void)addCompany:(BLCompany *) newCompany{
    [_CompanyArr addObject:newCompany];
    NSLog(@"%@",_CompanyArr.lastObject);
}

@end
