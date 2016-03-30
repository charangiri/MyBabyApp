//
//  HealthBookletViewController.m
//  BabyApp
//
//  Created by Charan Giri on 28/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import "HealthBookletViewController.h"

@interface HealthBookletViewController ()
{
    float width;
    float imageSize;
}
@end

@implementation HealthBookletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self circleViewCreation];

}


-(void)circleViewCreation
{
    width= 250;
    imageSize=70;
   
    
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(_baseCircleView.frame.origin.x, _baseCircleView.frame.origin.y, width, width)] CGPath]];
    [[_baseCircleView layer] addSublayer:circleLayer];
    [circleLayer setStrokeColor:[[UIColor grayColor] CGColor]];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    [circleLayer setLineWidth:  15.0f];
    
    float  centerImageLocation =width/2 -imageSize/2;
    
    UIView *circleView=[[UIView alloc] initWithFrame:CGRectMake(centerImageLocation, centerImageLocation, imageSize, imageSize)];
    circleView.backgroundColor = [UIColor blueColor];
    [_baseCircleView addSubview:circleView];
    
    
    UIButton *immunisationButton;
    UIButton *screeningButton;
    UIButton *percentilesButton;
    UIButton *oralButton;
    UIButton *allergyButton;
    
    
    immunisationButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [immunisationButton setTitle:@"Immun" forState:UIControlStateNormal];
    immunisationButton.frame=CGRectMake(centerImageLocation, -imageSize/2, imageSize, imageSize);
    [_baseCircleView addSubview:immunisationButton];
    
    
    
    screeningButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [screeningButton setTitle:@"screeningButton" forState:UIControlStateNormal];
    screeningButton.frame=CGRectMake(-imageSize/2, imageSize, imageSize, imageSize);
    [_baseCircleView addSubview:screeningButton];
    
    
    percentilesButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [percentilesButton setTitle:@"percentilesButton" forState:UIControlStateNormal];
    percentilesButton.frame=CGRectMake(width-imageSize/2, imageSize, imageSize, imageSize);
    [_baseCircleView addSubview:percentilesButton];
    
    
    allergyButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [allergyButton setTitle:@"allergyButton" forState:UIControlStateNormal];
    allergyButton.frame=CGRectMake(width/2-imageSize*2, width-imageSize, imageSize, imageSize);
    [_baseCircleView addSubview:allergyButton];
    
    oralButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [oralButton setTitle:@"oralButton" forState:UIControlStateNormal];
    oralButton.frame=CGRectMake(width/2+imageSize, width-imageSize, imageSize, imageSize);
    [_baseCircleView addSubview:oralButton];
    
    [immunisationButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    [screeningButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    [percentilesButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    [allergyButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    [oralButton setBackgroundImage:[UIImage imageNamed:@"needle_icon.png"] forState:UIControlStateNormal];
    
    
    [immunisationButton addTarget:self action:@selector(immunisationButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)immunisationButtonAction
{
    [self performSegueWithIdentifier:@"immunisationTableSegue" sender:self];
  
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)screeningAction:(id)sender {
}

- (IBAction)childSafetyAction:(id)sender {
}
@end
