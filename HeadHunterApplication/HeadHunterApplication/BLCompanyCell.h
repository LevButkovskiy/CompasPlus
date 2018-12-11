//
//  BLCompanyCell.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 07/12/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLCompany.h"

NS_ASSUME_NONNULL_BEGIN

@interface BLCompanyCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* labelCompanyName;
@property (nonatomic, weak) IBOutlet UIImageView *companyLogo;
@property (nonatomic, strong) BLCompany * company;

@end

NS_ASSUME_NONNULL_END
