//
//  ScreeningParentalViewController.m
//  BabyApp
//
//  Created by Atul Awasthi on 08/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "ScreeningParentalViewController.h"

@interface ScreeningParentalViewController ()

@end

@implementation ScreeningParentalViewController
@synthesize screeningConcernTable;
NSArray *labelArray2;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedScreenLbl"];
    
    // Do any additional setup after loading the view.
    labelArray2=[NSArray arrayWithObjects:@"Your child display excitement like kicking legs,moving arms,on seeing an attractive toy.(Excites at a toy)*Age 5.5 months*yes",@"Your child will try to get a toy that he enjoys when it is out of reach by streching his arms or body.(Works for a toy out of reach)*Age 6.5 months*yes",@"Your child seem to be shy or wary of strangers.(React to stranger)*Age 10 months*no",@"When you fae your child ,say bye-bye and wave to him,he responds by waving his arm,hand and fingers without his hands or arms being touched.(Waves)*Age 10.5 months*no",@"Lorem Ispum,Proin gravida nibh velt (A toy)*Age 15.5 months*no", nil];
    
    
    screeningConcernTable=[[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:screeningConcernTable];
    [screeningConcernTable setBounces:NO];
    
    screeningConcernTable.dataSource=self;
    screeningConcernTable.delegate=self;
    // [screeningConcernTable reloadData];
    [screeningConcernTable setBackgroundColor:[UIColor whiteColor]];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Stores2"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Stores2"];
        
        
        UILabel *lblName=nil;
        
        lblName=[[UILabel alloc] initWithFrame:CGRectMake(10,20, screeningConcernTable.frame.size.width-40, 30)];
        lblName.tag=10;
        [cell.contentView addSubview:lblName];
        
        [lblName setFont:[UIFont fontWithName:@"HelveticaNeueCyr-Light" size:18]];
        
        
        UIButton *btIcon=[[UIButton alloc] initWithFrame:CGRectMake(screeningConcernTable.frame.size.width-40,10,30,30)];
        btIcon.tag=20;
        [cell.contentView addSubview:btIcon];
        [btIcon setContentMode:UIViewContentModeScaleAspectFill];
        [btIcon setClipsToBounds:YES];
        
        
        
        UIImageView *ivIcon=[[UIImageView alloc] initWithFrame:CGRectMake(10,cell.frame.size.height-30,20,20)];
        ivIcon.image=[UIImage imageNamed:@"stop_watch_time.png"];
        ivIcon.tag=30;
        [cell.contentView addSubview:ivIcon];
        [ivIcon setContentMode:UIViewContentModeScaleAspectFill];
        [ivIcon setClipsToBounds:YES];
        
        //[ivIcon setHidden:YES];
        
        UILabel *lblage=nil;
        
        lblage=[[UILabel alloc] initWithFrame:CGRectMake(10,20, screeningConcernTable.frame.size.width-40, 30)];
        lblage.tag=40;
        [cell.contentView addSubview:lblage];
        
        [lblage setFont:[UIFont fontWithName:@"HelveticaNeueCyr-Light" size:16]];
        
    }
    //Screenings-checked_03.png
    UILabel *lblName=[cell.contentView viewWithTag:10];
    UIButton *btIcon=[cell.contentView viewWithTag:20];
    UILabel *lblage=[cell.contentView viewWithTag:40];
    UIImageView *ivIcon=[cell.contentView viewWithTag:30];
    [lblName setTextColor:[UIColor grayColor]];
    
    NSString *s=[[[labelArray2 objectAtIndex:indexPath.row] componentsSeparatedByString:@"*"] objectAtIndex:0];
    int n=(int)s.length/30;
    
    if((int)s.length%30!=0)
        n++;
    lblName.frame=CGRectMake(20,5, screeningConcernTable.frame.size.width-60, n*20);
    
    [lblName setNumberOfLines:0];
    [lblName setLineBreakMode:NSLineBreakByWordWrapping];
    
    lblage.frame=CGRectMake(40,lblName.frame.size.height, screeningConcernTable.frame.size.width-70, 30);
    ivIcon.frame=CGRectMake(10,lblName.frame.size.height+5,20,20);
    
    
    [lblName setText:s];
    [lblage setText:[[[labelArray2 objectAtIndex:indexPath.row] componentsSeparatedByString:@"*"] objectAtIndex:1]];
    if(indexPath.row<2)
        [btIcon setBackgroundImage:[UIImage imageNamed:@"Screenings-checked_03.png"] forState:UIControlStateNormal];
    else
        [btIcon setBackgroundImage:[UIImage imageNamed:@"crv.png"] forState:UIControlStateNormal];
    
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    // [[NSUserDefaults standardUserDefaults] setObject:[labelArray objectAtIndex:indexPath.row] forKey:@"selectedScreenLbl"];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"didDeselectRowAtIndexPath");
    
    //    [self performSegueWithIdentifier:@"parentalconcernsegu" sender:self];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return labelArray2.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *s=[[[labelArray2 objectAtIndex:indexPath.row] componentsSeparatedByString:@"*"] objectAtIndex:0];
    
    NSLog(@"string length=%lu",(unsigned long)s.length);
    int n=(int)s.length;
    
    int n1=n/30;
    if(n%30!=0)
        n1++;
    
    return n1*20+30;
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
