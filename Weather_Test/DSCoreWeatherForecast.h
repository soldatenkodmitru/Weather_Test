//
//  DSCoreWeatherForecast.h
//  Weather_Test
//
//  Created by Dima on 11/9/14.
//  Copyright (c) 2014 Dima Soldatenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DSCoreWeatherForecast : NSManagedObject

@property (nonatomic, retain) NSString * forecastLow;
@property (nonatomic, retain) NSString * forecastDate;
@property (nonatomic, retain) NSDate* forecastHigh;
@property (nonatomic, retain) NSString * forecastText;

@end
