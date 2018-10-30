//
//  ViewController.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 19/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "ViewController.h"

@interface UIViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Initialization Company(-es)
    BLCompany *Company = [[BLCompany alloc] initWithString:(@"CompanyName") andID:0];
    BLCompany *Company2 = [[BLCompany alloc] initWithString:(@"CompanyName2") andID:1];
    
    //Initialization of array
    BLCompanies *arrayOfCompanies = [[BLCompanies alloc]initWithArray];
    //Adding Company(-es) to array
    [arrayOfCompanies addCompany:Company];
    [arrayOfCompanies addCompany:Company2];
    
  //  NSLog(@"%i)Company name:%@",Company.ID, Company.Name);
    
    //------------------------------------API-----------------------------------//
    
        //
        // NSURLSessionDataTask *dataTask = [session.];
    //------------------------------------------------------------------------//
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void) requestData
{
    NSURLSession *session = [NSURLSession.sharedSession;
    NSURL *baseURL = [NSURL URLWithString:@"http://api.hh.ru/employers"];
    [session dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
          NSLog(@"%@", error);
        }
        else{
            
        }
    }];
}
@end
