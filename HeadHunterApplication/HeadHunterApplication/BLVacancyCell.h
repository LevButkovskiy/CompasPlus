//
//  BLVacancyCell.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 18/12/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLVacancies.h"

NS_ASSUME_NONNULL_BEGIN

@interface BLVacancyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *vacancyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateOfPublishingLabel;
@property (weak, nonatomic) IBOutlet UILabel *salaryFromToLabel;
@property (weak, nonatomic) IBOutlet UIImageView *likeImage;

@property (nonatomic, strong) BLVacancies * vacancy;


- (void)setVacancy:(BLVacancies *)vacancy;

@end

NS_ASSUME_NONNULL_END
