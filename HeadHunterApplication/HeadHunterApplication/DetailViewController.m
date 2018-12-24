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
    __weak IBOutlet UITableView *_tableView;
    
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"Вакансии: %@",@(_company.vacancies.count)];
    [_tableView registerNib:[UINib nibWithNibName:@"BLVacancyCell" bundle:nil] forCellReuseIdentifier:@"vacancyCell"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->_tableView reloadData];
    });
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
    cell.dateOfPublishingLabel.text = [NSString stringWithFormat:@"%@", vacancy.dateOfPublishing];
    cell.salaryFromToLabel.text = [self checkSalaryFrom:vacancy.salaryFrom To:vacancy.salaryTo];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(vacancy.liked == false)
        cell.likeImage.hidden = true;
    else
        cell.likeImage.hidden = false;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BLVacancies *vacancy = [_company.vacancies objectAtIndex:indexPath.row];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"VacancyInfo" sender:vacancy];
    });
}
- ( void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    BLVacancyInfoViewController *info = segue.destinationViewController;
    BLVacancies *vacancy = sender;
    NSLog(@"%@", vacancy.name);
    info.vacancy = vacancy;
}
-(NSString *)checkSalaryFrom:(long)salaryFrom To:(long)salaryTo{
    NSString *returnString;
    if(salaryFrom == 0){
        if(salaryTo == 0){
            returnString =  [NSString stringWithFormat:@"%@", @"зарплата не указана"];
        }
        else{
            returnString = [NSString stringWithFormat:@"%@ %ld %@",@"до", salaryTo, @"RUR"];
        }
    }
    else if (salaryTo == 0){
        returnString = [NSString stringWithFormat:@"%@ %ld %@",@"от", salaryFrom, @"RUR"];
    }
    else {
        returnString = [NSString stringWithFormat:@"%@ %ld %@ %ld %@", @"от", salaryFrom, @"до", salaryTo, @"RUR"];
    }
    return returnString;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
 0BLVacancyInfoViewController * vac;
 if(vac.isClicked == true)
 cell.likeImage.hidden = false;
 else
 cell.likeImage.hidden = true;
 */

@end
