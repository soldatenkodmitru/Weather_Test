//
//  DSServerManager.h
//  Weather_Test
//
//  Created by Dima on 11/8/14.
//  Copyright (c) 2014 Dima Soldatenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSServerManager : NSObject


+ (DSServerManager *)sharedManager;

- (void)getForecastDaysCount :(NSInteger) count woeid: (NSString *) woeidCity onSuccess:(void (^) (NSMutableArray *weatherForecast)) success onFailure:(void (^) (NSError *error)) failure;

@end
