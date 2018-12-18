//
//  BLVacancies.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 30/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLVacancies : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;
//id
//дата публикации
//в порядке публицации (самые свежие)
//salary
//archived
- (id)initWithDictionary:(NSDictionary *)dictionary;



@end

NS_ASSUME_NONNULL_END
