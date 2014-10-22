//
//  MasterViewController.m
//  RaidPlanner
//
//  Created by Eduardo Alvarado Díaz on 10/22/14.
//  Copyright (c) 2014 Organization. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Adventurer.h"


@interface MasterViewController () <UITableViewDataSource>
@property NSArray *adventurers;

@end

@implementation MasterViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self loadAdventurers];
}

-(void)loadAdventurers{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Adventurer"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];

    self.adventurers = [self.managedObjectContext executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.adventurers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Adventurer *adventurer = [self.adventurers objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = adventurer.name;
    cell.detailTextLabel.text = @(adventurer.raids.count).description;
    
    return cell;
}

- (IBAction)onAddNewAdventurer:(UITextField *)sender {
    Adventurer *adventurer = [NSEntityDescription insertNewObjectForEntityForName:@"Adventurer" inManagedObjectContext:self.managedObjectContext];
    adventurer.name = sender.text;
    adventurer.species = [NSNumber numberWithInt:arc4random_uniform(4)];
    [self.managedObjectContext save:nil];
    sender.text = @"";
    [sender resignFirstResponder];
    [self loadAdventurers];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Adventurer *adventurer = [self.adventurers objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    DetailViewController *viewController = segue.destinationViewController;
    viewController.adventurer = adventurer;
}

-(IBAction)unwindFromDetailViewController:(UIStoryboardSegue *)segue{
    DetailViewController *viewController = segue.sourceViewController;
    Raid *raid = [viewController createRaid];
    [raid addAdventuresObject:viewController.adventurer];
    [self.managedObjectContext save:nil];
    [self loadAdventurers];
}

@end
