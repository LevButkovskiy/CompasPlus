//
//  BLCompany.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 19/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN

@interface BLCompany : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSNumber *numberOfVacancies;
@property (nonatomic, strong) NSString *logoURL;
@property (nonatomic, strong) NSNumber *page;
@property(readonly, copy) NSString *description;

- (id)initWithString:(NSString *)newName andID:(NSString *)newID;
- (id)initWithDictionary:(NSDictionary *)newDictionary;

@end
//NS_ASSUME_NONNULL_END
