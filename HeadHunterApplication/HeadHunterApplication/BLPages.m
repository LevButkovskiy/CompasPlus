//
//  BLPages.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 02/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLPages.h"

@implementation BLPages

- (id)initWithNumber:(NSNumber *)num{
    if(self = [super init]){
        self._page = num;
    }
    return self;
}

- (NSNumber *)nextPage{
    self._page = @(self._page.intValue + 1);
    return self._page;
}


@end
