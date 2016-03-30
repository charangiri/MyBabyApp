//
//  ScreeningViewController.h
//  BabyApp
//
//  Created by Atul Awasthi on 07/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreeningViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) UITableView *screeningTable;

@end
