//
//  BLCompanyCell.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 07/12/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLCompanyCell.h"
#import "BLAPI.h"
@implementation BLCompanyCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setCompany:(BLCompany *)company{
    _company = company;
    _labelCompanyName.text = _company.name;
    _companyLogo.image = _company.logo;
    if(company.logo == nil){
                [[BLAPI sharedInstance] imageWithURL:[_company.logoURL.allValues firstObject] completion:^(UIImage * _Nonnull image, NSError * _Nonnull error) {
            if(error != nil){
                NSLog(@"%@", error);
            }
            else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    company.logo = image;
                    _companyLogo.image = company.logo;
                });
            }
        }
         ];
    } else {
        _companyLogo.image = company.logo;
    }
}

@end
