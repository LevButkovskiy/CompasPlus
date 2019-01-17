//
//  BLVacancyInfo.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 21/12/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "BLVacancyInfoViewController.h"

@interface BLVacancyInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *vacancyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UITextView *employeeTasksLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
- (IBAction)likeButton:(id)sender;


@end

@implementation BLVacancyInfoViewController
- (void)viewDidLoad {
    if(_vacancy.liked == true){
        [_likeButton setImage:[UIImage imageNamed:@"like_red"] forState:(UIControlStateNormal)];
    }
    else{
        [_likeButton setImage:[UIImage imageNamed:@"like_gray"] forState:(UIControlStateNormal)];
    }
    [super viewDidLoad];
    _isClicked = false;
    _vacancyNameLabel.text = _vacancy.name;
    _addressLabel.text = _vacancy.summuryAdress;
    _contactNameLabel.text = _vacancy.contactName;
    _phoneLabel.text = _vacancy.contactPhone;
    _employeeTasksLabel.text = [NSString stringWithFormat:@"Опыт: %@\n\nЗадачи работника: %@ \n\n%@", _vacancy.snippetRequirement, _vacancy.snippetResponsibillity, [self checkSalaryFrom: _vacancy.salaryFrom To:_vacancy.salaryTo]];
    // Do any additional setup after loading the view.
}

-(void)setVacancy:(BLVacancies *)vacancy{
    _vacancy = vacancy;

}


- (IBAction)likeButton:(id)sender {
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat width = CGRectGetWidth(screen);
    CGFloat height = CGRectGetHeight(screen);
    double sViewHight = 60;
    SmileView *sView = [[[NSBundle mainBundle] loadNibNamed:@"SmileView" owner:self options:nil] objectAtIndex:0];
    [self.view addSubview:sView];
    if(_vacancy.liked == true){
        [_likeButton setImage:[UIImage imageNamed:@"like_gray"] forState:(UIControlStateNormal)];
         _vacancy.liked = false;
        sView.frame = CGRectMake(0, sViewHight, width, sViewHight);
        sView.likedLabel.text = @"Больше не нравится";
        [UIView animateWithDuration:1 animations:^{
            sView.frame = CGRectMake(0, 0, width, sViewHight);
        } completion:^(BOOL finished) {
            sView.alpha = 0;
        }];
    }
    else{
    [_likeButton setImage:[UIImage imageNamed:@"like_red"] forState:(UIControlStateNormal)];
     _vacancy.liked = true;
        sView.frame = CGRectMake(0, 0, width, sViewHight);
        sView.likedLabel.alpha = 1;
        sView.likedLabel.text = @"Понравилось";
        [UIView animateWithDuration:1 animations:^{
            sView.frame = CGRectMake(0, sViewHight, width, sViewHight);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                sView.alpha = 0;
            }];
        }];
    }
}
-(void)viewDidDisappear:(BOOL)animated{

}

-(NSString *)checkSalaryFrom:(long)salaryFrom To:(long)salaryTo{
    NSString *returnString;
    if(salaryFrom == 0){
        if(salaryTo == 0){
            returnString =  [NSString stringWithFormat:@"%@", @"Зарплата не указана"];
        }
        else{
            returnString = [NSString stringWithFormat:@"%@ %@ %ld %@",@"Зарплата:", @"до", salaryTo, @"RUR"];
        }
    }
    else if (salaryTo == 0){
        returnString = [NSString stringWithFormat:@"%@ %@ %ld %@",@"Зарплата:", @"от", salaryFrom, @"RUR"];
    }
    else {
        returnString = [NSString stringWithFormat:@"%@ %@ %ld %@ %ld %@",@"Зарплата:", @"от", salaryFrom, @"до", salaryTo, @"RUR"];
    }
    return returnString;
}

@end

