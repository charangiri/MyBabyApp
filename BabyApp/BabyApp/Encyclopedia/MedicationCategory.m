//
//  MedicationCategory.m
//  BabyApp
//
//  Created by Atul Awasthi on 17/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "MedicationCategory.h"

@interface MedicationCategory ()

@end

@implementation MedicationCategory
@synthesize medicationCategoryTable;
NSArray *labelArraymedicationCategory;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedMedicationLbl"];
    
    
    labelArraymedicationCategory=[NSArray arrayWithObjects:@"Lorem Ipsum",@"Aenean sollicitudin",@"Consequat ipsum",@"Consequat del velit", nil];
    
    
    medicationCategoryTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60)];
    [self.view addSubview:medicationCategoryTable];
    medicationCategoryTable.dataSource=self;
    medicationCategoryTable.delegate=self;
    
    [medicationCategoryTable setBounces:NO];
    // Do any additional setup after loading the view.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Stores"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Stores"];
        
        
        UILabel *lblName=nil;
        
        lblName=[[UILabel alloc] initWithFrame:CGRectMake(10,5, medicationCategoryTable.frame.size.width-30, 30)];
        lblName.tag=10;
        [cell.contentView addSubview:lblName];
        
        
        UILabel *lblName2=nil;
        
        lblName2=[[UILabel alloc] initWithFrame:CGRectMake(10,30,medicationCategoryTable.frame.size.width-30, 80)];
        lblName2.tag=20;
        [cell.contentView addSubview:lblName2];
        [lblName setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16]];
        [lblName2 setFont:[UIFont fontWithName:@"HelveticaNeueCyr-Light" size:18]];
        
        
        [lblName2 setLineBreakMode:NSLineBreakByWordWrapping];
        [lblName2 setNumberOfLines:0];
        
    }
    UILabel *lblName=[cell.contentView viewWithTag:10];
    UILabel *lblName2=[cell.contentView viewWithTag:20];
    
    
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    [lblName setText:[labelArraymedicationCategory objectAtIndex:indexPath.row]];
    
    
    [lblName2 setText:@"Lorem Ipsum proin gravida nibh vel velit auctor aliquet . Aenean sollicitudin .lorem quis bibendum auctor , nist elit consequat del velit quis aliquet."];
    [lblName2 setTextColor:[UIColor grayColor]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"didDeselectRowAtIndexPath");
    
    
    [self performSegueWithIdentifier:@"medicationcategorydetailsegu" sender:self];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return labelArraymedicationCategory.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
