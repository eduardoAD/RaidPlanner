//
//  Raid.h
//  RaidPlanner
//
//  Created by Eduardo Alvarado Díaz on 10/22/14.
//  Copyright (c) 2014 Organization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Raid : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSSet *adventures;
@end

@interface Raid (CoreDataGeneratedAccessors)

- (void)addAdventuresObject:(NSManagedObject *)value;
- (void)removeAdventuresObject:(NSManagedObject *)value;
- (void)addAdventures:(NSSet *)values;
- (void)removeAdventures:(NSSet *)values;

@end
