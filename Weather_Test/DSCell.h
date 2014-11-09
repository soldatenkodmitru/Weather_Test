//
//  DSCell.h
//  Weather_Test
//
//  Created by Dima on 11/9/14.
//  Copyright (c) 2014 Dima Soldatenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UILabel *labelTHigh;
@property (weak, nonatomic) IBOutlet UILabel *labelTlow;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;

@end
