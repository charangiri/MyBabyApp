//
//  BioDataTableViewController.m
//  BabyApp
//
//  Created by Charan Giri on 20/02/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "BioDataTableViewController.h"
#import "ProfilePicTableViewCell.h"
#import "BioDataTableViewCell.h"

@interface BioDataTableViewController ()
{
    NSArray *titleArray;
}
@end

@implementation BioDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    titleArray=[NSArray arrayWithObjects:@"",@"BIRTH RECORD",@"PARTICULAR OF PARENTS",@"SIGNIFICANT EVENTS",@"NEWBORN SCREENING",@"INVESTIGATION(S) DONE (if any)",@"INFORMATION ON DISCHARGE", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.row==0)
    {
        
        return 270;

    }
    else{
        return 50;
  
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    ProfilePicTableViewCell *cell = nil;
    BioDataTableViewCell *cell1=nil;
    
    if (indexPath.row==0)
    {
            
            cell=(ProfilePicTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ProfilePicCellIdentifier"];
            return cell;
    }
    else
    {
            cell1 = (BioDataTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BioDataCellIdentifier"];
        cell1.titleLabel.text=titleArray[indexPath.row];
      
//        cell1.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"blue_background_small.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
//        cell1.selectedBackgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"blue_background_small.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
        
            return cell1;
       
    }

    
    
    //BioDataCellIdentifier  ProfilePicCellIdentifier
 
    // Configure the cell...
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
if(indexPath.row==1)
    [self performSegueWithIdentifier:@"birthSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
