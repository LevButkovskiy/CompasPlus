//
//  ViewController.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 19/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_companies;
    __weak IBOutlet UITableView *_tableView;
}
@property(nonatomic, strong)BLAPI *session;
@property(nonatomic, strong)BLPages *thisPage;

@end

@implementation ViewController

- (void)viewDidLoad {
    //Initialization Company(-es)
    
    [super viewDidLoad];
    self.navigationItem.title = @"Компании";
    _companies = @[].mutableCopy; 
    
    _session = [BLAPI sharedInstance];
    _session.block = ^(NSDictionary * _Nonnull json, NSError * _Nonnull error) {
        if(error){
            NSLog(@"Error");
        }
        else{
            if(json != nil){
                [self processDictionary: json];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self->_tableView reloadData];
                });
                
            }
        }
    };

    //https://api.hh.ru/employers?per_page=20&page=200
    _thisPage = [[BLPages alloc]initWithNumber:@(0)];
    [_session requestDataForType:@"employers" onPage:_thisPage._page perPage:@(20)];
   /* [session requestDataForType:@"employers" onPage:@(0) perPage:@(20) completion:^(NSDictionary * _Nonnull json, NSError * _Nonnull error) {
        if(error){
            NSLog(@"Error");
        }
        else{
            if(json != nil){
                [self processDictionary: json];
            }
        }
    }
     ];*/
}
- (void)load
{
    [self viewDidLoad];
}

- (void)processDictionary:(NSDictionary *)json
{
    NSArray *items = [json objectForKey:@"items"];
    for (NSDictionary *item in items) {
        BLCompany *company = [[BLCompany alloc] initWithDictionary:item];
        NSLog(@"add company:<%@>", company); // add company: <Имя>:<ID>
        [_companies addObject:company];
    }
    NSLog(@"");
}


- (void)processArray:(NSArray *)json
{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _companies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    BLCompany *company = [_companies objectAtIndex:indexPath.row];
    cell.textLabel.text = company.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.row == _companies.count-1){
        [_session requestDataForType:@"employers" onPage:_thisPage.nextPage perPage:@(20)];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BLCompany *company = [_companies objectAtIndex:indexPath.row];
    NSLog(@"%@", company.name);
    [self performSegueWithIdentifier:@"Detail" sender:company];
}





- ( void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}
@end
