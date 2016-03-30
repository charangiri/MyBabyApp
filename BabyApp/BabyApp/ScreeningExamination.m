//
//  ScreeningExamination.m
//  BabyApp
//
//  Created by Atul Awasthi on 09/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "ScreeningExamination.h"

@interface ScreeningExamination ()

@end

@implementation ScreeningExamination
@synthesize screeningExaminationTable;
//screeningexaminationsegue
NSArray *labelArrayExamination;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View did load Screening Examination");
    // Do any additional setup after loading the view.
    labelArrayExamination=[NSArray arrayWithObjects:@"Fixation on moving object:",@"Right eye",@"Left eye",@"Cornea/Lens",@"Pupillary Light reflex",@"Red reflex",@"Nystagmus",@"Sqint",@"Roving eye movement",@"Fontanelies", nil];
    
    self.navigationItem.title = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedScreenLbl"];
    UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 50)];
    [v setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:240.0/255.0 alpha:1.0]];
    [self.view addSubview:v];
    
 
    
    UILabel *lblHeading=[[UILabel alloc] initWithFrame:CGRectMake(30,10, v.frame.size.width-60, 30)];
    [v addSubview:lblHeading];
    [lblHeading setText:@"EYE EXAMINATION:"];
   // [lblHeading setTextColor:[UIColor blackColor]];
  //[lblHeading setTextAlignment:NSTextAlignmentCenter];

    
    screeningExaminationTable=[[UITableView alloc] initWithFrame:CGRectMake(0, v.frame.origin.y+v.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height-(v.frame.origin.y+v.frame.size.height+10))];
    [self.view addSubview:screeningExaminationTable];
    screeningExaminationTable.dataSource=self;
    screeningExaminationTable.delegate=self;
    
    // Do any additional setup after loading the view.
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
     if (section==0)
         return 0;
    else
    return 30;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Stores"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Stores"];
        
        
        UILabel *lblName=nil;
        
        lblName=[[UILabel alloc] initWithFrame:CGRectMake(20,15, screeningExaminationTable.frame.size.width-80, 30)];
        lblName.tag=10;
        [lblName setFont:[UIFont fontWithName:@"HelveticaNeueCyr-Light" size:16]];

        [cell.contentView addSubview:lblName];
        
        if (indexPath.section==0)
        {
        if(indexPath.row==1||indexPath.row==2)
        lblName.frame=CGRectMake(lblName.frame.origin.x+20, lblName.frame.origin.y, lblName.frame.size.width-20,lblName.frame.size.height);
        }
        
        if(indexPath.row>0||indexPath.section==1)
        {
        UIButton *btIcon=[[UIButton alloc] initWithFrame:CGRectMake(screeningExaminationTable.frame.size.width-40,10,30,30)];
        btIcon.tag=20;
        [cell.contentView addSubview:btIcon];
        [btIcon setContentMode:UIViewContentModeScaleAspectFill];
        [btIcon setClipsToBounds:YES];
        }
        
        if(indexPath.section==0)
        {
            if(indexPath.row>=6&&indexPath.row<=8)
            {
                UISegmentedControl *sgt=[self maheSegmentControl:YES];
                [cell.contentView addSubview:sgt];
                sgt.tag=30;

            }
            
        }
    }
    UIButton *btIcon=[cell.contentView viewWithTag:20];
    
    if((indexPath.section==0&&(indexPath.row>=1&&indexPath.row<=5))||(indexPath.section==1&&indexPath.row==0))
    {
    [btIcon setHidden:NO];
    if((indexPath.section==0&&indexPath.row>2))
        [btIcon setBackgroundImage:[UIImage imageNamed:@"crv.png"] forState:UIControlStateNormal];

    else
        [btIcon setBackgroundImage:[UIImage imageNamed:@"Screenings-checked_03.png"] forState:UIControlStateNormal];
    }
    else
        [btIcon setHidden:YES];


    UITextField *lblName=[cell.contentView viewWithTag:10];
    
    [lblName setTextColor:[UIColor grayColor]];
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    if (indexPath.section==0)
    {
        [lblName setText:[labelArrayExamination objectAtIndex:indexPath.row]];
    }
    else
    {
        [lblName setText:[labelArrayExamination lastObject]];

    }

    

    return cell;
    
}

-(UISegmentedControl*)maheSegmentControl:(BOOL)b
{
    UISegmentedControl *segment;
    NSArray *ar=@[@"YES",@"NO"];
    segment=[[UISegmentedControl alloc] initWithItems:ar];
    segment.frame=CGRectMake(screeningExaminationTable.frame.size.width-90,15,80,30);
    return segment;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] setObject:[labelArrayExamination objectAtIndex:indexPath.row] forKey:@"selectedScreenLbl"];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"didDeselectRowAtIndexPath");
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==1)
        return 1;
    else
    return labelArrayExamination.count-1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
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
