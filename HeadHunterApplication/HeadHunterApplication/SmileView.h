//
//  SmileView.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 11/01/2019.
//  Copyright © 2019 Lev Butkovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SmileView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *likedLabel;

@end

NS_ASSUME_NONNULL_END
