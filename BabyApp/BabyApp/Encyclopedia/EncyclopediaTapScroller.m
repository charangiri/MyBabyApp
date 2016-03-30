//
//  EncyclopediaTapScroller.m
//  BabyApp
//
//  Created by Atul Awasthi on 16/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "EncyclopediaTapScroller.h"

@interface EncyclopediaTapScroller ()
@property UIScrollView *scroll1;
@property UIPageControl *page1;

@end

@implementation EncyclopediaTapScroller
@synthesize scrollerTable;
NSArray *labelArrayScroller;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Medi";
    
    
     labelArrayScroller=[NSArray arrayWithObjects:@"ANTIHISTAMINES",@"FEVER MEDICATIONS",@"COUGH EXPETORANTS",@"MUCOLYTICS",@"MIXED COUGH PREPARATIONS",@"NASAL",@"LOZENGES",@"ANTINIOTICS",@"ANTIEMETICS",@"ANTISPAMODIC",@"TOPICAL", nil];
    
    UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 150)];
    [v setBackgroundColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    [self.view addSubview:v];

    UILabel *lbl1=[[UILabel alloc] initWithFrame:CGRectMake(10,5, self.view.frame.size.width-20, 40)];
    [v addSubview:lbl1];
   // [lbl1 setBackgroundColor:[UIColor redColor]];
    
    UISearchBar *search=[[UISearchBar alloc] initWithFrame:CGRectMake(10,55, self.view.frame.size.width-20, 40)];
    [v addSubview:search];
    
    UIView *vLine=[[UIView alloc] initWithFrame:CGRectMake(0, 105, self.view.frame.size.width,2)];
    [vLine setBackgroundColor:[UIColor whiteColor]];
    [v addSubview:vLine];
    
    UILabel *lbl2=[[UILabel alloc] initWithFrame:CGRectMake(10,117, self.view.frame.size.width-20, 40)];
    [v addSubview:lbl2];

    [lbl1 setText:@"Type in for a quick search in the database"];
    [lbl2 setText:@"SEARCH BY CATEGORIES BELOW"];

    [lbl1 setTextAlignment:NSTextAlignmentCenter];
    [lbl2 setTextAlignment:NSTextAlignmentCenter];

    [lbl1 setTextColor:[UIColor whiteColor]];
    [lbl2 setTextColor:[UIColor whiteColor]];


    scrollerTable=[[UITableView alloc] initWithFrame:CGRectMake(0, v.frame.origin.y+v.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height-(v.frame.origin.y+v.frame.size.height+20))];
    [self.view addSubview:scrollerTable];
    scrollerTable.dataSource=self;
    scrollerTable.delegate=self;
    
  
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Stores"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Stores"];
        
        
        UILabel *lblName=nil;
        
        lblName=[[UILabel alloc] initWithFrame:CGRectMake(10,5, scrollerTable.frame.size.width-30, 30)];
        lblName.tag=10;
        [cell.contentView addSubview:lblName];
        
        
        UILabel *lblName2=nil;
        
        lblName2=[[UILabel alloc] initWithFrame:CGRectMake(10,30,scrollerTable.frame.size.width-30, 30)];
        lblName2.tag=20;
        [cell.contentView addSubview:lblName2];
        [lblName setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12]];
        [lblName2 setFont:[UIFont fontWithName:@"HelveticaNeueCyr-Light" size:12]];
 
        
        
        
    }
    UILabel *lblName=[cell.contentView viewWithTag:10];
    UILabel *lblName2=[cell.contentView viewWithTag:20];
    
    
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    [lblName setText:[labelArrayScroller objectAtIndex:indexPath.row]];
    
   
    [lblName2 setText:@"Examples:Proingravida,nibh vel velit,aliquet"];
    [lblName setTextColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] setObject:[labelArrayScroller objectAtIndex:indexPath.row] forKey:@"selectedScreenLbl"];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"didDeselectRowAtIndexPath");
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return labelArrayScroller.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)btnClicked2
{
    [self performSegueWithIdentifier:@"medicationcategorysegu" sender:self];

}
-(void)btnClicked22
{
    [self performSegueWithIdentifier:@"immunisationtypesegu" sender:self];
    
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
