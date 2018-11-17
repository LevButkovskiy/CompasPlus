//
//  BLPages.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 02/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLPages.h"

@implementation BLPages

- (id)initWithDictionary:(NSDictionary *)newDictionary {
    
    if(self = [super init]){
        self.elementsPerPage = [newDictionary objectForKey:@"per_page"];
        self.numberOfPages = [newDictionary objectForKey:@"pages"];
        self.numberThisPage = [newDictionary objectForKey:@"page"];
    }
    return self;
}

- (void)nextPage{
    self.numberThisPage = @(self.numberThisPage.intValue + 1);
}


@end
