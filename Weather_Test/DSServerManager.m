//
//  DSServerManager.m
//  Weather_Test
//
//  Created by Dima on 11/8/14.
//  Copyright (c) 2014 Dima Soldatenko. All rights reserved.
//

#import "DSServerManager.h"
#import "DSWeatherForecast.h"
#import "AFNetworking.h"


@interface DSServerManager () <NSXMLParserDelegate>

@property (strong,nonatomic) AFHTTPRequestOperationManager *requestOperationManager;
@property (strong,nonatomic) NSMutableArray * weatherForecast;

@end

@implementation DSServerManager

+ (DSServerManager *)sharedManager {
    
    static DSServerManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DSServerManager alloc]init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:@"http://weather.yahooapis.com/"]];
        self.weatherForecast= [NSMutableArray array];
    }
    return self;
}

- (void)getForecastDaysCount :(NSInteger) count woeid: (NSString *) woeidCity onSuccess:(void (^) (NSMutableArray *weatherForecast)) success onFailure:(void (^) (NSError *error)) failure {

    NSDictionary *paramDictionary = [NSDictionary dictionaryWithObjectsAndKeys:woeidCity,@"w",@"c",@"u", nil];
    self.requestOperationManager.responseSerializer =[AFXMLParserResponseSerializer serializer];
    self.requestOperationManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@ "application/rss+xml"  ];
    [self.requestOperationManager GET:@"forecastrss" parameters:paramDictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {        
        
        NSXMLParser* XmlParser = (NSXMLParser*)responseObject;
        XmlParser.delegate = self;
        [XmlParser parse] ;
        
       [self.weatherForecast removeObjectsInRange:NSMakeRange(count,[self.weatherForecast count]-count)];
        success([self.weatherForecast copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(error);
    }];

}

#pragma mark - NSXMLParserDelegate

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{    
 
    if ([elementName isEqualToString:@"yweather:forecast"] ){
        
        DSWeatherForecast *curForecast = [[DSWeatherForecast alloc]init];
        curForecast.forecastHigh = [attributeDict objectForKey:@"high"] ;
        curForecast.forecastLow =  [attributeDict objectForKey:@"low"];
        curForecast.forecastText  = [attributeDict objectForKey:@"text"] ;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"d LLLL yyyy "];
        curForecast.forecastDate = [dateFormat dateFromString:[attributeDict objectForKey:@"date"] ];        
        [self.weatherForecast addObject:curForecast];
        }
    
    }
    


@end
