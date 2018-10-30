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
    if(self = [super init]){
        _companyArr = [[NSMutableArray alloc] init];
    }
    return self;
}

//Adding company to array of companies
- (void)addCompany:(BLCompany *) newCompany{
    [_companyArr addObject:newCompany];
    NSLog(@"%@",_companyArr.lastObject);
}

@end
