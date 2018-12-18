//
//  BLVacancies.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 30/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//Users/butkovskiylev/Documents/GitHub/CompasPlus/HeadHunterApplication/HeadHunterApplication/BLAPI.h//

#import "BLVacancies.h"

@implementation BLVacancies

- (id)initWithDictionary:(NSDictionary *)dictionary{
    
    if(self = [super init]){
        self.name = [dictionary objectForKey:@"name"];
        self.url = [dictionary objectForKey:@"url"];
    }
    return self;
}

@end
