//
//  Adventurer.h
//  RaidPlanner
//
//  Created by Eduardo Alvarado Díaz on 10/22/14.
//  Copyright (c) 2014 Organization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Raid;

@interface Adventurer : NSManagedObject

@property (nonatomic, retain) NSNumber * species;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *raids;
@end

@interface Adventurer (CoreDataGeneratedAccessors)

- (void)addRaidsObject:(Raid *)value;
- (void)removeRaidsObject:(Raid *)value;
- (void)addRaids:(NSSet *)values;
- (void)removeRaids:(NSSet *)values;

@end
