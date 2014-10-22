//
//  DetailViewController.h
//  RaidPlanner
//
//  Created by Eduardo Alvarado Díaz on 10/22/14.
//  Copyright (c) 2014 Organization. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Adventurer.h"
#import "Raid.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Adventurer *adventurer;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

-(Raid *)createRaid;

@end

