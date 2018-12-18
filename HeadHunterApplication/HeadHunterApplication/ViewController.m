//
//  ViewController.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 19/10/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "ViewController.h"
#import "BLCompanyCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *_companies;
    __weak IBOutlet UITableView *_tableView;
}
@property(nonatomic, strong)BLAPI *session;
@property(nonatomic, strong)BLPages *thisPage;

@end

@implementation ViewController

-(void)didNextPage: (NSNotification *)notify {
    self.navigationItem.title = [NSString stringWithFormat:@"Загружено: %@",notify.object];
}

- (void)viewDidLoad {
    //Initialization Company(-es)
    
    [super viewDidLoad];
    self.navigationItem.title = @"Компании";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didNextPage:) name:@"nextPage" object:nil];
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
    

    _thisPage = [[BLPages alloc]initWithNumber:@(0)];
    [_session requestDataForType:@"employers" onPage:_thisPage._page perPage:@(20)];
    //https://api.hh.ru/employers?per_page=20&page=200
    
    [_tableView registerNib:[UINib nibWithNibName:@"BLCompanyCell" bundle:nil] forCellReuseIdentifier:@"companyCell"];
    
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
-(void)loadVacancy:(BLCompany *)company{
    [_session requestVacansyForCompany:company completion:^(NSDictionary * _Nonnull vacJson, NSError * _Nonnull vacError) {
        if(vacError){
            NSLog(@"Error");
        }
        else{
            if(vacJson != nil){
                NSArray *vacItems = [vacJson objectForKey:@"items"];
                if([company.vacancies firstObject] == nil)
                for (NSDictionary *vacItem in vacItems) {
                    BLVacancies *vacancy = [[BLVacancies alloc] initWithDictionary:vacItem];
                    NSLog(@"added vacancy");
                    [company.vacancies addObject: vacancy.name];
                }
                NSLog(@"");
                if(company.vacancies.count != 0)
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self performSegueWithIdentifier:@"Detail" sender:company];
                });
            }
        }
    }
    ];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _companies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    BLCompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"companyCell"];
    BLCompany *company = [_companies objectAtIndex:indexPath.row];
    cell.company = company;
    //cell.textLabel.text = company.name;
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
    [self loadVacancy:company];
    NSLog(@"%@", company.name);
}

- ( void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *controller = segue.destinationViewController;
    controller.company = sender;
}
@end
