//
//  DetailViewController.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 23/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UITableView *_tableView;}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"Вакансии: %@",@(_company.vacancies.count)];
    [_tableView registerNib:[UINib nibWithNibName:@"BLVacancyCell" bundle:nil] forCellReuseIdentifier:@"vacancyCell"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _company.vacancies.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BLVacancyCell * cell = [tableView dequeueReusableCellWithIdentifier:@"vacancyCell"];
    BLVacancies *vacancy = [_company.vacancies objectAtIndex:indexPath.row];
    cell.vacancyNameLabel.text = vacancy.name;
    cell.dateOfPublishingLabel.text = vacancy.dateOfPublishing;
    cell.salaryFromToLabel.text = [NSString stringWithFormat:@"%ld-%ld", vacancy.salaryFrom, vacancy.salaryTo];
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    /*if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }*/
    //BLCompany *company = [_companies objectAtIndex:indexPath.row];
    //cell.textLabel.text = [_company.vacancies objectAtIndex:indexPath.row];
  //  cell.accessoryType = UITableViewCellAccessoryDetailButton;
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
