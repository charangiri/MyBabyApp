//
//  GrowthScreening.m
//  BabyApp
//
//  Created by Atul Awasthi on 08/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "GrowthScreening.h"

@interface GrowthScreening ()

@end

@implementation GrowthScreening

@synthesize screeningGrowthTable;
NSArray *labelArrayGrowth;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    labelArrayGrowth=[NSArray arrayWithObjects:@"Weight*kg",@"Length*cm",@"Occipitofrontal Circumference*cm", nil];
    
    self.navigationItem.title = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedScreenLbl"];
    UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 50)];
    [v setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:240.0/255.0 alpha:1.0]];
    [self.view addSubview:v];
    
    screeningGrowthTable=[[UITableView alloc] initWithFrame:CGRectMake(0, v.frame.origin.y+v.frame.size.height+10, self.view.frame.size.width, 180)];
    [self.view addSubview:screeningGrowthTable];
    screeningGrowthTable.dataSource=self;
    screeningGrowthTable.delegate=self;

    // Do any additional setup after loading the view.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Stores"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Stores"];
        
        
        UITextField *lblName=nil;
        
        lblName=[[UITextField alloc] initWithFrame:CGRectMake(20,15, screeningGrowthTable.frame.size.width-80, 30)];
        lblName.tag=10;
        [cell.contentView addSubview:lblName];
        
        UILabel *lblMesure=nil;
        lblMesure=[[UILabel alloc] initWithFrame:CGRectMake(screeningGrowthTable.frame.size.width-50,15, 40, 30)];
        lblMesure.tag=20;
        [cell.contentView addSubview:lblMesure];

        
       
        
    }
    UITextField *lblName=[cell.contentView viewWithTag:10];
    UILabel *lblMesure=[cell.contentView viewWithTag:20];

   
    [cell setBackgroundColor:[UIColor whiteColor]];

    [lblMesure setTextColor:[UIColor grayColor]];
    
    [lblName setPlaceholder:[[[labelArrayGrowth objectAtIndex:indexPath.row] componentsSeparatedByString:@"*"] objectAtIndex:0]];
    [lblMesure setText:[[[labelArrayGrowth objectAtIndex:indexPath.row] componentsSeparatedByString:@"*"] objectAtIndex:1]];

    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] setObject:[labelArrayGrowth objectAtIndex:indexPath.row] forKey:@"selectedScreenLbl"];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"didDeselectRowAtIndexPath");
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return labelArrayGrowth.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"accessoryButtonTappedForRowWithIndexPath at row=%ld",(long)indexPath.row);
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
