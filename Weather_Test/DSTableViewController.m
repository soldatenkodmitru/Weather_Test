//
//  DSTableViewController.m
//  Weather_Test
//
//  Created by Dima on 11/8/14.
//  Copyright (c) 2014 Dima Soldatenko. All rights reserved.
//

#import "DSTableViewController.h"
#import "DSServerManager.h"
#import "DSDataManager.h"
#import "DSWeatherForecast.h"
#import "DSCell.h"

@interface DSTableViewController ()

@property (strong,nonatomic) NSArray *weatherArray;

@end

@implementation DSTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
     UIBarButtonItem* plus =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:self
                                                  action:@selector(refreshWeather:)];
    
    self.navigationBarItem.rightBarButtonItem = plus;
    self.weatherArray =[[DSDataManager dataManager]allObjects];    
    [self downloadData];
   
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.weatherArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    DSCell *cell =(DSCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[DSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
   
    DSWeatherForecast* curForecast = [[DSWeatherForecast alloc]init];
    curForecast = [self.weatherArray objectAtIndex:[indexPath row ]];
    cell.labelText.text = curForecast.forecastText;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EE, d LLL yyyy"];
    cell.labelDate.text = [dateFormat stringFromDate:curForecast.forecastDate];
    cell.labelTHigh.text = curForecast.forecastHigh;
    cell.labelTlow.text = curForecast.forecastLow;
    return cell;
}

- (void) refreshWeather:(id) sender{
    [self downloadData];
}

-   (void) downloadData {
    [[DSServerManager sharedManager]getForecastDaysCount:2 woeid:@"918981" onSuccess:^(NSMutableArray *weatherForecast) {
        self.weatherArray = weatherForecast ;
        [self.tableView reloadData];
        [[DSDataManager dataManager] deleteAllObjects];
        [[DSDataManager dataManager] saveObjects:self.weatherArray];
        
    } onFailure:^(NSError *error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}



@end
