//
//  ScreeningViewController.m
//  BabyApp
//
//  Created by Atul Awasthi on 07/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "ScreeningViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ScreeningViewController ()

@end

@implementation ScreeningViewController
@synthesize screeningTable;
NSArray *labelArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableDictionary *titleBarAttributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [titleBarAttributes setValue:[UIFont boldSystemFontOfSize:20] forKey:UITextAttributeFont];
    [[UINavigationBar appearance] setTitleTextAttributes:titleBarAttributes];
    
    labelArray=[NSArray arrayWithObjects:@"DEVELOPMENTAL CHECKLIST",@"Personal Social",@"Fine Motor-Adaptive",@"Language",@"Gross Motor",@"GROWTH",@"OTHER SCREENING",@"Physical Examination",@"Outcome", nil];
    UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 50)];
    [v setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:240.0/255.0 alpha:1.0]];
    [self.view addSubview:v];
    
    UILabel *lblHeading=[[UILabel alloc] initWithFrame:CGRectMake(30,10, v.frame.size.width-60, 30)];
    [v addSubview:lblHeading];
    [lblHeading setText:@"6 MONTHS TO 12 MONTHS"];
    
    [lblHeading setTextColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    [lblHeading setTextAlignment:NSTextAlignmentCenter];
    
    
    UIView *v2=[[UIView alloc] initWithFrame:CGRectMake(25, v.frame.origin.y+v.frame.size.height+20, self.view.frame.size.width-50, 90)];
    [v2 setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:240.0/255.0 alpha:1.0]];
    [self.view addSubview:v2];
    [[v2 layer] setCornerRadius:5];
    
   
    UIView *vLine=[[UIView alloc] initWithFrame:CGRectMake(0, v2.frame.size.height/2-0.3, v2.frame.size.width,0.6)];
    [vLine setBackgroundColor:[UIColor grayColor]];
    [v2 addSubview:vLine];
    
    UIView *hLine=[[UIView alloc] initWithFrame:CGRectMake((v2.frame.size.width*70)/100,0,0.6,v2.frame.size.height/2)];
    [hLine setBackgroundColor:[UIColor grayColor]];
    [v2 addSubview:hLine];
    
    UITextField *txtDate,*txtAge,*txtCare;
    txtDate=[[UITextField alloc] initWithFrame:CGRectMake(8,0, (v2.frame.size.width*70)/100-15, v2.frame.size.height/2)];
    
    txtAge=[[UITextField alloc] initWithFrame:CGRectMake((v2.frame.size.width*70)/100+8,0,(v2.frame.size.width*30)/100-15,v2.frame.size.height/2)];
    
    txtCare=[[UITextField alloc] initWithFrame:CGRectMake(8,v2.frame.size.height/2,v2.frame.size.width-15,v2.frame.size.height/2)];
    
    [v2 addSubview:txtDate];
    [v2 addSubview:txtAge];
    [v2 addSubview:txtCare];

    txtDate.placeholder=@"Date of Screening";
    txtAge.placeholder=@"Age";
    txtCare.placeholder=@"Main Caregiver";

    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(25, v2.frame.origin.y+v2.frame.size.height+10, self.view.frame.size.width-50, 30)];
    [self.view addSubview:lbl];
    [lbl setText:@"Parental Concerns"];
    [lbl setTextColor:[UIColor colorWithRed:242.0/255.0 green:176.0/255.0 blue:42.0/255.0 alpha:1.0]];
    [lbl setTextAlignment:NSTextAlignmentRight];

    screeningTable=[[UITableView alloc] initWithFrame:CGRectMake(0, lbl.frame.origin.y+lbl.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height-(lbl.frame.origin.y+lbl.frame.size.height+20))];
    [self.view addSubview:screeningTable];
    screeningTable.dataSource=self;
    screeningTable.delegate=self;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Stores"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Stores"];
        
        
        UILabel *lblName=nil;
    
        lblName=[[UILabel alloc] initWithFrame:CGRectMake(10,20, screeningTable.frame.size.width-50, 30)];
        lblName.tag=10;
        [cell.contentView addSubview:lblName];
        
        [lblName setFont:[UIFont fontWithName:@"HelveticaNeueCyr-Light" size:18]];
        
        UIImageView *ivIcon=[[UIImageView alloc] initWithFrame:CGRectMake(10,10,40,40)];
        ivIcon.image=[UIImage imageNamed:@"screening_icon.png"];
        ivIcon.tag=20;
        [cell.contentView addSubview:ivIcon];
        [ivIcon setContentMode:UIViewContentModeScaleAspectFill];
        [ivIcon setClipsToBounds:YES];
        [ivIcon setHidden:YES];
        
       
    }
    UILabel *lblName=[cell.contentView viewWithTag:10];
    UIImageView *ivIcon=[cell.contentView viewWithTag:20];
    if(indexPath.row==0||indexPath.row==5||indexPath.row==6)
    {
        [cell setBackgroundColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
        [lblName setTextColor:[UIColor whiteColor]];
        [ivIcon setHidden:NO];
        lblName.frame=CGRectMake(50,20, screeningTable.frame.size.width-100, 30);
    }
    else
    {
        [cell setBackgroundColor:[UIColor whiteColor]];
        [lblName setTextColor:[UIColor grayColor]];
        [ivIcon setHidden:YES];
        lblName.frame=CGRectMake(10,20, screeningTable.frame.size.width-50, 30);

    }
 
     if(indexPath.row==0)
         cell.accessoryType = UITableViewCellAccessoryDetailButton;
    else
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;


    
    [lblName setText:[labelArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
[[NSUserDefaults standardUserDefaults] setObject:[labelArray objectAtIndex:indexPath.row] forKey:@"selectedScreenLbl"];
[tableView deselectRowAtIndexPath:indexPath animated:NO];
NSLog(@"didDeselectRowAtIndexPath");
    if(indexPath.row==7)
        [self performSegueWithIdentifier:@"screeningexaminationsegue" sender:self];
   else if(indexPath.row==8)
        [self performSegueWithIdentifier:@"screeningoutcomeoptionsegu" sender:self];
    else if(indexPath.row==6)
        [self performSegueWithIdentifier:@"otherscreensegu" sender:self];
    else if(indexPath.row==5)
        [self performSegueWithIdentifier:@"growthsegu" sender:self];
    else
       [self performSegueWithIdentifier:@"parentalconcernsegu" sender:self];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return labelArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
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
