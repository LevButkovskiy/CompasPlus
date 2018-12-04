//
//  DetailViewController.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 23/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
{
    __weak IBOutlet UILabel *_companyNameLabel;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    _companyNameLabel.text = @"Имя компании";
    [super viewDidLoad];
    
    _companyNameLabel.text = [self.company.vacancies firstObject];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
