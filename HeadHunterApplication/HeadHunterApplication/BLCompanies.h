//
//  BLCompanies.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 25/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLCompany.h"

NS_ASSUME_NONNULL_BEGIN

@interface BLCompanies : BLCompany
@property (nonatomic, strong) NSMutableArray *companyArr;

- (id)initWithArray;
- (void)addCompany:(NSObject *) newCompany;
@end

NS_ASSUME_NONNULL_END
