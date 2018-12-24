//
//  BLVacancyInfo.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 21/12/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BLVacancies.h"
#import "DetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BLVacancyInfoViewController : UIViewController

@property (nonatomic, strong) BLVacancies * vacancy;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) BOOL isClicked;


-(void)setVacancy:(BLVacancies *)vacancy;


@end

NS_ASSUME_NONNULL_END
