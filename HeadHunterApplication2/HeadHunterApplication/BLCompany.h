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
@property (nonatomic, strong) NSString *Name;
@property (nonatomic, assign) int ID;
@property (nonatomic, strong) NSString *ImageURL;

- (id)initWithString:(NSString *)newName andID:(int)newID;
- (void)sayHello;
@end
//NS_ASSUME_NONNULL_END
