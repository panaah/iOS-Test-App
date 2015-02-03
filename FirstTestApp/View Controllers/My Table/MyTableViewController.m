//
//  MyTableViewController.m
//  FirstTestApp
//
//  Created by Thakur VJ on 09/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "MyTableViewController.h"
#import "DetailViewController.h"
#import "Player.h"
#import "PlayerCell.h"
#import "HelperFunctions.h"

@interface MyTableViewController ()<UIActionSheetDelegate>
{
    NSDictionary *pastChampions;
    NSMutableArray *arrPlayers;
    NSMutableArray *allKeys;
    NSString *cellIdentifier;
    NSIndexPath *selectedIndexpath;
}

@end

@implementation MyTableViewController

/*
- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"My Table";
    }
    return self;
}
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self loadPlayers];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    cellIdentifier = @"my_custom_cell_identifier";
    [self.tableView registerNib:[UINib nibWithNibName:@"PlayerCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return allKeys.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}

// custom view for header. will be adjusted to default or specified header height
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *lblHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    lblHeader.backgroundColor = [UIColor lightGrayColor];
    lblHeader.text = [allKeys objectAtIndex:section];
    return lblHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40;
}

// custom view for footer. will be adjusted to default or specified footer height
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *viewFooter = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    viewFooter.backgroundColor = [UIColor clearColor];
    
    UIButton *btnDeleteSection = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
    btnDeleteSection.backgroundColor = [UIColor orangeColor];
    btnDeleteSection.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [btnDeleteSection setTitle:@"Delete Section" forState:UIControlStateNormal];
    [btnDeleteSection addTarget:self action:@selector(btnDeleteSectionClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnDeleteSection.tag = section;
    [viewFooter addSubview:btnDeleteSection];;
    
    return viewFooter;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[[arrPlayers objectAtIndex:section] players] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Player *objPlayer = [arrPlayers objectAtIndex:indexPath.section];
    [cell setupPlayerCellFor:objPlayer];
    if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
    
/*
    NSString static *identifier = @"my_custom_cell_identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    Player *objPlayer = [arrPlayers objectAtIndex:indexPath.section];
    
    cell.textLabel.text = objPlayer.playerName;
    cell.detailTextLabel.text = objPlayer.playerDescription;
    
    if (indexPath.row % 3 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the cell...
    
    return cell;
*/
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        DetailViewController *objDetailVC = [[DetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
        objDetailVC.pageTitle = [NSString stringWithFormat:@"Section=%ld Row=%ld",indexPath.section,indexPath.row];
        objDetailVC.arrOptions = [NSMutableArray arrayWithObjects:@"First",@"Second",@"Third",@"Fourth",@"Fifth", nil];
        [self.navigationController pushViewController:objDetailVC animated:YES];
    }
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        return NO;
    } else {
        return YES;
    }
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
//        rows--;
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
//        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
/*
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Vicky";
}
*/

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) {
    
    UITableViewRowAction *more = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"More" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
            NSLog(@"More Action : more more more");
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"More Options.." delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Rate",@"Ask Me",@"Feedback",@"Destructive", nil];
        [sheet setDestructiveButtonIndex:3];
        [sheet showFromTabBar:self.tabBarController.tabBar];
    }];
    more.backgroundColor = [UIColor orangeColor];

    UITableViewRowAction *flag = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Flag" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"Flag Action : Flag Flag Flag");
    }];
    flag.backgroundColor = [UIColor darkGrayColor];

    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"Delete Action : Delete Delete Delete");
//        rows--;
        selectedIndexpath = indexPath;
        [[HelperFunctions sharedInstance] showAlertWithTitle:@"Are you sure?" message:@"This will delete your cell. Operation can not be undone. Proceed?" delegate:self cancelButtonTitle:@"Yes, Go Ahead" otherButtonTitles:@"No, leave it"];
    }];

    return @[more,flag,delete];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            NSLog(@"Rate clicked");
            break;
        case 1:
            NSLog(@"Ask Me clicked");
            break;
        case 2:
            NSLog(@"Feedback clicked");
            break;
        case 3:
            NSLog(@"Destructive clicked");
            break;
        default:
            NSLog(@"Cancel clicked");
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: { // yes clicked
            NSLog(@"%@",[arrPlayers objectAtIndex:selectedIndexpath.section]);
            Player *player = [arrPlayers objectAtIndex:selectedIndexpath.section];
            [player.players removeObjectAtIndex:selectedIndexpath.row];
            
            [self.tableView deleteRowsAtIndexPaths:@[selectedIndexpath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        default:
            break;
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Custom
- (void)btnDeleteSectionClicked:(UIButton *)sender {
    NSLog(@"Delete section index = %ld",sender.tag);
    [allKeys removeObjectAtIndex:sender.tag];
    [arrPlayers removeObjectAtIndex:sender.tag];
    
    [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationBottom];
}

- (void)loadPlayers {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PastChampions" ofType:@"plist"];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path];
    pastChampions = [data valueForKey:@"PastChampions"];
    
    allKeys = [[pastChampions allKeys] mutableCopy];

    arrPlayers = [NSMutableArray new];
    for (NSString *key in allKeys) {
        Player *objPlayer = [Player new];
        [objPlayer fillPlayerInfo:[pastChampions valueForKey:key]];
        [arrPlayers addObject:objPlayer];
    }
    NSLog(@"arrPlayers.count = %ld",(long)arrPlayers.count);
}

@end
