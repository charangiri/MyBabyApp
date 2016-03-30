//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"



#import "HeartTypeTableViewCell.h"
#import "ProfileTableViewCell.h"


@implementation LeftMenuViewController
{
    NSArray *section1Array,*section2Array,*section3Array;
    NSInteger noofSections;
    BOOL dropdownSelected;
}
#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    noofSections=4;
    dropdownSelected=NO;

    section1Array=[NSArray arrayWithObjects:@"Baby Booklet",@"New Immunisation",@"New Screening", nil];
    section2Array=[NSArray arrayWithObjects:@"New Immunisation",@"New Screening",@"My Growth Percentiles",@"Health Book",@"Encyclopedia", nil];
    section3Array=[NSArray arrayWithObjects:@"Settings",@"Sign Out", nil];


	self.tableView.separatorColor = [UIColor lightGrayColor];
    self.tableView.delegate=self;
        self.tableView.dataSource=self;
	
	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.jpg"]];
	self.tableView.backgroundView = imageView;
}

#pragma mark - UITableView Delegate & Datasrouce -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 60;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return noofSections;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"";
            break;
        case 1:
            sectionName = @"MY OPTIONS";
            break;
        case 2:
            sectionName = @"Main menu";
            break;
            
        case 3:
            sectionName=  @"OTHERS";
            break;
            // ...
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (dropdownSelected) {
        return 4;

    }
    else{
        
    switch (section)
    {
        case 0:
            return 1;
            break;
            
        case 1:
            return section1Array.count;
            break;
            
        case 2:
            return section2Array.count;
            break;
            
        case 3:
            return section3Array.count;
            break;
    }
    }
    return 4;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeartTypeTableViewCell*cell2=nil;
    ProfileTableViewCell *cell1=nil;

    if (dropdownSelected) {
        
        if (indexPath.row==0) {
            
            cell1=[tableView dequeueReusableCellWithIdentifier:@"profileIdentifier"];
            cell1.babyNameLabel.text=@"Charan Giri";
            return cell1;
        }
        else
        {
            cell1=[tableView dequeueReusableCellWithIdentifier:@"profileIdentifier"];
            cell1.babyNameLabel.text=@"Other Kids";
            cell1.dropdown.hidden=YES;
            return cell1;
        }
        
    }
    else{
        
    
        switch (indexPath.section)
        {
            case 0:

                cell1=[tableView dequeueReusableCellWithIdentifier:@"profileIdentifier"];
                cell1.babyNameLabel.text=@"Charan Giri";
                return cell1;
                break;
                
            case 1:
                 cell2 = (HeartTypeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"heartTypeIdentifier"];
                cell2.contentNameLabel.text = section1Array[indexPath.row];
                return cell2;
                break;
                
            case 2:
                cell2 = (HeartTypeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"heartTypeIdentifier"];
                cell2.contentNameLabel.text = section2Array[indexPath.row];
                return cell2;
                break;
                
            case 3:
                cell2 = (HeartTypeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"heartTypeIdentifier"];
                cell2.contentNameLabel.text = section3Array[indexPath.row];
                return cell2;
                break;
        }
    }
	
	
	cell1.backgroundColor = [UIColor whiteColor];
	
	return cell1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    
    /*
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
															 bundle: nil];
	
	UIViewController *vc ;
	
	switch (indexPath.row)
	{
		case 0:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
			break;
			
		case 1:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
			break;
			
		case 2:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"FriendsViewController"];
			break;
			
		case 3:
			[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
			[[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
			return;
			break;
	}
	
	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
															 withSlideOutAnimation:self.slideOutAnimationEnabled
																	 andCompletion:nil];
     
     */
    
    if (indexPath.row==0 && indexPath.section==0) {
        
    
    if (dropdownSelected) {
        dropdownSelected=NO;
        noofSections=4;
    }
    else
    {
        noofSections=1;
        dropdownSelected=YES;
    }
    [self.tableView reloadData];
    }
}

-(void)buttonClickedEvent
{
    
}

- (IBAction)kidDropdownAction:(id)sender {
    if (dropdownSelected) {
        dropdownSelected=NO;
        noofSections=4;
    }
    else
    {
        noofSections=1;
        dropdownSelected=YES;
    }
    
}
- (IBAction)babyDropdownAction:(id)sender {
}
@end
