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
@synthesize scrollerTable,scrollerTable2,scroll1,page1;
NSArray *labelArrayScroller,*labelArrayScroller2;
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat width = scrollView.frame.size.width;
    NSInteger page = (scrollView.contentOffset.x + (0.5f * width)) / width;
    [page1 setCurrentPage:page];
    
    self.navigationItem.title = [hed objectAtIndex:page];
    
    
    /*if((((int)scrollView.contentOffset.x)%((int)scrollView.frame.size.width))<=0)
     [page1 setCurrentPage:0];
     else
     [page1 setCurrentPage:1];*/
    
    NSLog(@"current page=%ld",(long)page1.currentPage);
    
    [scrollerTable reloadData];
}

NSArray *hed;
- (void)viewDidLoad {
    [super viewDidLoad];
    hed=@[@"Medication",@"Immunisation"];
    self.navigationItem.title = [hed objectAtIndex:0];
    
    
    
    /*
     
     
     scrollerTable=[[UITableView alloc] initWithFrame:CGRectMake(0, v.frame.origin.y+v.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height-(v.frame.origin.y+v.frame.size.height+20))];
     [self.view addSubview:scrollerTable];
     scrollerTable.dataSource=self;
     scrollerTable.delegate=self;
     
     scrollerTable2=[[UITableView alloc] initWithFrame:CGRectMake(0, v.frame.origin.y+v.frame.size.height+10, self.view.frame.size.width, self.view.frame.size.height-(v.frame.origin.y+v.frame.size.height+20))];
     [self.view addSubview:scrollerTable2];
     scrollerTable2.dataSource=self;
     scrollerTable2.delegate=self;
     */
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
    labelArrayScroller=[NSArray arrayWithObjects:@"ANTIHISTAMINES",@"FEVER MEDICATIONS",@"COUGH EXPETORANTS",@"MUCOLYTICS",@"MIXED COUGH PREPARATIONS",@"NASAL",@"LOZENGES",@"ANTINIOTICS",@"ANTIEMETICS",@"ANTISPAMODIC",@"TOPICAL", nil];
    
    labelArrayScroller2=[NSArray arrayWithObjects:@"BCG",@"HEPATITIS B",@"DTAP",@"MMR", nil];
    
    CGRect scrollFrame = CGRectMake(0, 60, [self.view bounds].size.width, [self.view bounds].size.height-60);
    scroll1 = [[UIScrollView alloc]initWithFrame: scrollFrame];
    
    [self.view addSubview:scroll1];
    [scroll1 setBackgroundColor:[UIColor blueColor]];
    
    scroll1.delegate=self;
    
    UIView *v1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, scroll1.frame.size.width, scroll1.frame.size.height)];
    [scroll1 addSubview:v1];
    [v1 setBackgroundColor:[UIColor redColor]];
    
    UIView *v2=[[UIView alloc] initWithFrame:CGRectMake(scroll1.frame.size.width, 0, scroll1.frame.size.width, scroll1.frame.size.height)];
    
    NSLog(@"self.view height=%f scrollbar height=%f v1 hight=%f",self.view.frame.size.height,scroll1.frame.size.height,v1.frame.size.height);
    [scroll1 addSubview:v2];
    [scroll1 setContentSize:CGSizeMake(scroll1.frame.size.width*2, scroll1.frame.size.height)];
    [v1 setBackgroundColor:[UIColor redColor]];
    [v2 setBackgroundColor:[UIColor greenColor]];
    
    [scroll1 setBounces:NO];
    
    [scroll1 setPagingEnabled:YES];
    UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0, 0,scroll1.frame.size.width, 150)];
    [v setBackgroundColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    [v1 addSubview:v];
    
    UILabel *lbl1=[[UILabel alloc] initWithFrame:CGRectMake(10,5, self.view.frame.size.width-20, 40)];
    [v addSubview:lbl1];
    
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
    
    UIView *vv2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    [vv2 setBackgroundColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    [v2 addSubview:vv2];
    
    UILabel *lbl12=[[UILabel alloc] initWithFrame:CGRectMake(10,5, self.view.frame.size.width-20, 40)];
    [vv2 addSubview:lbl12];
    
    UISearchBar *search2=[[UISearchBar alloc] initWithFrame:CGRectMake(10,55, self.view.frame.size.width-20, 40)];
    [vv2 addSubview:search2];
    
    UIView *vLine2=[[UIView alloc] initWithFrame:CGRectMake(0, 105, self.view.frame.size.width,2)];
    [vLine2 setBackgroundColor:[UIColor whiteColor]];
    [vv2 addSubview:vLine2];
    
    UILabel *lbl22=[[UILabel alloc] initWithFrame:CGRectMake(10,117, self.view.frame.size.width-20, 40)];
    [vv2 addSubview:lbl22];
    
    [lbl12 setText:@"Type in for a quick search in the database"];
    [lbl22 setText:@"SEARCH BY CATEGORIES BELOW"];
    
    [lbl12 setTextAlignment:NSTextAlignmentCenter];
    [lbl22 setTextAlignment:NSTextAlignmentCenter];
    
    [lbl12 setTextColor:[UIColor whiteColor]];
    [lbl22 setTextColor:[UIColor whiteColor]];
    
    
    scrollerTable=[[UITableView alloc] initWithFrame:CGRectMake(0, v.frame.origin.y+v.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-(v.frame.origin.y+v.frame.size.height))];
    [v1 addSubview:scrollerTable];
    scrollerTable.dataSource=self;
    scrollerTable.delegate=self;
    
    scrollerTable2=[[UITableView alloc] initWithFrame:CGRectMake(0, vv2.frame.origin.y+vv2.frame.size.height, self.view.frame.size.width, scroll1.frame.size.height-(vv2.frame.origin.y+vv2.frame.size.height))];
    [v2 addSubview:scrollerTable2];
    scrollerTable2.dataSource=self;
    scrollerTable2.delegate=self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    page1=[[UIPageControl alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-15, 60, 30, 20)];
    [page1 setNumberOfPages:2];
    [page1 setCurrentPage:0];
    
    [self.view addSubview:page1];
    [self.view bringSubviewToFront:page1];
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
    
    
    if(page1.currentPage==0)
        [lblName setText:[labelArrayScroller objectAtIndex:indexPath.row]];
    else
        [lblName setText:[labelArrayScroller2 objectAtIndex:indexPath.row]];
    
    
    
    [lblName2 setText:@"Examples:Proingravida,nibh vel velit,aliquet"];
    [lblName setTextColor:[UIColor colorWithRed:49.0/255.0 green:191.0/255.0 blue:180.0/255.0 alpha:1.0]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults] setObject:[labelArrayScroller objectAtIndex:indexPath.row] forKey:@"selectedMedicationLbl"];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"didDeselectRowAtIndexPath");
    
    //medicationcategorysegu
    
    [self performSegueWithIdentifier:@"medicationcategorysegu" sender:self];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(page1.currentPage==0)
        return labelArrayScroller.count;
    else
        return labelArrayScroller2.count;
    
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
