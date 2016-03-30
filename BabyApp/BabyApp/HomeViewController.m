//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftMenuViewController.h"
#import "HomeTableViewCell.h"
@implementation HomeViewController
{
    NSArray *titlesArray,*imagesNames,*colorArray;
}
- (IBAction)helthBookletClicked:(id)sender {
    NSLog(@"helthBookletClicked");
    [self performSegueWithIdentifier:@"healthBookletsegue" sender:self];

    //growthsummarysegu
}
- (IBAction)encyclopediaClicked:(id)sender
{
    NSLog(@"encyclopediaClicked");
    [self performSegueWithIdentifier:@"encyclopediatapscrollersegu" sender:self];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.navigationController.navigationBarHidden=NO;

    imagesNames=[NSArray arrayWithObjects:@"needle_icon.png",@"screening_icon.png",@"growth_icon.png", nil];
    titlesArray=[NSArray arrayWithObjects:@"My Immunisation",@"My Screening",@"My Growth Percentiles", nil];
    colorArray=[NSArray arrayWithObjects:@"D35560",@"F8C34F",@"53B8B1", nil];


}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return NO;
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

#pragma mark - UITableView Delegate & Datasrouce -


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return imagesNames.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 70;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 60;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = (HomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"homeCellIdentifier"];
    cell.backgroundColor=[UIColor whiteColor];
    cell.imageViewContent.image=[UIImage imageNamed:imagesNames[indexPath.row]];
    cell.titleLabel.text=titlesArray[indexPath.row];
    cell.titleLabel.textColor=[ self colorWithHexString:colorArray[indexPath.row]];
    cell.subtitleLabel.text=@"Not yet started";
    cell.subtitleLabel.textColor=[UIColor grayColor];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(indexPath.row==1)
    {
    [self performSegueWithIdentifier:@"screenpagesegu" sender:self];
    }
    else if(indexPath.row==2)
    {
        [self performSegueWithIdentifier:@"growthsummarysegu" sender:self];
    }
    
}
#pragma mark - IBActions -


@end
