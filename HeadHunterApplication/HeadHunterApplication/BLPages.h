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
@property (nonatomic, strong) NSNumber *elementsPerPage;
@property (nonatomic, strong) NSNumber *numberOfPages;
@property (nonatomic, strong) NSNumber *numberThisPage;

- (id)initWithDictionary:(NSDictionary *)newDictionary;
- (void)nextPage;



@end

NS_ASSUME_NONNULL_END

