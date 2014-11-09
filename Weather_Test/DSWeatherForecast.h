//
//  DSWeatherForecast.h
//  Weather_Test
//
//  Created by Dima on 11/9/14.
//  Copyright (c) 2014 Dima Soldatenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSWeatherForecast : NSObject


@property (nonatomic, retain) NSString * forecastLow;
@property (nonatomic, retain) NSDate * forecastDate;
@property (nonatomic, retain) NSString * forecastHigh;
@property (nonatomic, retain) NSString * forecastText;

@end

