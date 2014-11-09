//
//  DSDataManager.h
//  Weather_Test
//
//  Created by Dima on 11/8/14.
//  Copyright (c) 2014 Dima Soldatenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSDataManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (void) deleteAllObjects;
- (NSArray*) allObjects;
- (void) saveObjects: (NSArray* ) Array;
- (NSURL *)applicationDocumentsDirectory;

+ (DSDataManager*) dataManager;

@end
