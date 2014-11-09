//
//  DSTableViewController.h
//  Weather_Test
//
//  Created by Dima on 11/8/14.
//  Copyright (c) 2014 Dima Soldatenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSTableViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem* navigationBarItem;

@end
