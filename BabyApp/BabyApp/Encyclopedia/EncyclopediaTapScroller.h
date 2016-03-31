//
//  EncyclopediaTapScroller.h
//  BabyApp
//
//  Created by Atul Awasthi on 16/03/16.
//  Copyright © 2016 Infinity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EncyclopediaTapScroller : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic) UITableView *scrollerTable,*scrollerTable2;


@end
