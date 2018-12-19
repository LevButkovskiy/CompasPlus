//
//  DetailViewController.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 23/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLAPI.h"
#import "BLCompany.h"
#import "BLVacancies.h"
#import "BLVacancyCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (nonatomic, strong) BLCompany * company;
-(NSString *)checkSalaryFrom:(long)salaryFrom To:(long)salaryTo;
@end

NS_ASSUME_NONNULL_END
