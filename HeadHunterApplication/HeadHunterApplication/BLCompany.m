//
//  BLCompany.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 19/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLCompany.h"
@implementation BLCompany

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ : %@",
            [self name], [self ID]];
}

//Elements initialization
- (id)initWithString:(NSString *)newName andID:(NSString *)newID{
   
    if(self = [super init]){
        
        _name = newName;
        _ID = newID;
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)newDictionary{
    
    if(self = [super init]){
        self.name = [newDictionary objectForKey:@"name"];
        self.ID = [newDictionary objectForKey:@"id"];
        self.url = [newDictionary objectForKey:@"url"];
        self.numberOfVacancies = [newDictionary objectForKey:@"open_vacancies"];
        self.logoURL = [newDictionary objectForKey:@"logo_urls"];
    }
    return self;
}

@end
