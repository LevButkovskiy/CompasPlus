//
//  BLCompany.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 19/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLCompany.h"
#import "BLAPI.h"
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
    self.vacancies = @[].mutableCopy;
    if(self = [super init]){
        self.name = [newDictionary objectForKey:@"name"];
        self.ID = [newDictionary objectForKey:@"id"];
        self.url = [newDictionary objectForKey:@"url"];
        self.numberOfVacancies = [newDictionary objectForKey:@"open_vacancies"];
        self.logoURL = [newDictionary objectForKey:@"logo_urls"];
        if(self.logo == nil){
            [[BLAPI sharedInstance] imageWithURL:[self.logoURL.allValues firstObject] completion:^(UIImage * _Nonnull image, NSError * _Nonnull error) {
                if(error != nil){
                    NSLog(@"%@", error);
                }
                else{
                        self.logo = image;
                }
            }
             ];
            
        }
    }
    return self;
}

@end
