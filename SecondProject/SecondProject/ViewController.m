//
//  ViewController.m
//  SecondProject
//
//  Created by Lev Butkovskiy on 12/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *ThemeChanger;
@property (strong, nonatomic) IBOutlet UIImageView *Background;
@property (strong, nonatomic) IBOutlet UILabel *LabelHelloWorld;
@property (strong, nonatomic) IBOutlet UITextField *InputField;
@property (strong, nonatomic) IBOutlet UIStepper *Stepper;
@property (strong, nonatomic) IBOutlet UIProgressView *ProgressView;
@property (strong, nonatomic) IBOutlet UIImageView *SampleImage;

@end

@implementation ViewController
- (IBAction)ThemeChanger:(id)sender {
    if((_ThemeChanger.selectedSegmentIndex == 0)){
        self.Background.backgroundColor = [UIColor whiteColor];
        self.LabelHelloWorld.textColor = [UIColor blackColor];
        self.InputField.textColor = [UIColor blackColor];
    }
    if((_ThemeChanger.selectedSegmentIndex == 1)){
        self.Background.backgroundColor = [UIColor darkGrayColor];
        self.LabelHelloWorld.textColor = [UIColor whiteColor];
        self.InputField.textColor = [UIColor blackColor];
    }
}
- (IBAction)ClickButton:(id)sender {
    //_LabelHelloWorld.text = @"CLICKKKK";
    _LabelHelloWorld.text = _InputField.text;
    //_LabelHelloWorld.text = [NSString stringWithFormat:@"%f",_Stepper.value];
}
- (IBAction)Stepper:(id)sender {
    _Stepper.minimumValue = 0;
    _ProgressView.progress = _Stepper.value/10;
    _SampleImage.alpha = _Stepper.value/10;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end



