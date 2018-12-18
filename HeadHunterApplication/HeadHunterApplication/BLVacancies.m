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
        self.ID = [dictionary objectForKey:@"id"];
        self.dateOfPublishing = [dictionary objectForKey:@"published_at"];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
        NSDate *dateFromString = [dateFormatter dateFromString:_dateOfPublishing];
        self.archived = [dictionary objectForKey:@"archived"];
        
        NSDictionary *salary = [dictionary objectForKey:@"salary"];
        if([salary isKindOfClass:[NSNull class]]){
            NSLog(@"ERROR: salary is null");
        }
        else{
            if([[salary objectForKey:@"to"] isKindOfClass:[NSNull class]])
                NSLog(@"ERROR: salary is null");
            else self.salaryTo = [[salary objectForKey:@"to"]longValue];
            if([[salary objectForKey:@"from"] isKindOfClass:[NSNull class]])
            NSLog(@"ERROR: salary is null");
            else self.salaryFrom = [[salary objectForKey:@"from"]longValue];
            if([[salary objectForKey:@"currency"] isKindOfClass:[NSNull class]])
                NSLog(@"ERROR: salary is null");
            else self.salaryCurrency = [salary objectForKey:@"currency"];

        }
        
    }
    return self;
}

@end
