//
//  MasterViewController.m
//  SwapiApp
//
//  Created by Daniel on 19/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "DLMKModelServer.h"
#import "DLMKCharacter.h"
#import "DLMKCustomCellTypeCollection.h"
#import "DLMKCharacter_Cell.h"

@interface MasterViewController ()

@property (nonatomic,strong) NSMutableArray* characters;
@property (nonatomic, strong) DLMKCustomCellTypeCollection* cells;

@end

@implementation MasterViewController

#pragma mark - Properties
-(NSMutableArray*) characters{
    if (_characters == nil)
        _characters = [NSMutableArray arrayWithCapacity:10];
    return _characters;
}

#pragma mark - Instance Methods
- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //ADD
    /*
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
     */

    NSArray* cellTypes = @[[DLMKCharacter_Cell class]];
    self.cells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:cellTypes];
    [self.cells registerNibsForTableView:self.tableView ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ADD
/*
- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
 */

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath.row < self.characters.count){
            NSObject *object = self.characters[indexPath.row];
            DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
            [controller setDetailItem:object];
            controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
            controller.navigationItem.leftItemsSupplementBackButton = YES;
        }
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UITableViewCell *cell = [self.cells cellForTableView:tableView atIndex:0];

    if (self.characters.count < indexPath.row + 1){
         [cell setValue:nil forKey:@"characterModel"];
        [[DLMKModelServer SINGLETON]  characterAtIndex:indexPath.row
                                            aBlock:^(DLMKCharacter* character)  {
                                                [self.characters addObject:character ];
                                                //cell.textLabel.text = [character description ];
                                                [cell setValue:character forKey:@"characterModel"];
                                            }];
    }
    else
    {
        DLMKCharacter* character = [self.characters objectAtIndex:indexPath.row];
        [cell setValue:character forKey:@"characterModel"];
    }
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.cells heightForIndex:0 ];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //[self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

@end
