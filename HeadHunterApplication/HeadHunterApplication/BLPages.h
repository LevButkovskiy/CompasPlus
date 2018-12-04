//
//  BLPages.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 02/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLPages : NSObject
@property (nonatomic, strong) NSNumber *_page;

- (id)initWithNumber:(NSNumber *)num;
- (NSNumber *)nextPage;



@end

NS_ASSUME_NONNULL_END

