//
//  GlobalPreferences.m
//  FirstTestApp
//
//  Created by Thakur VJ on 29/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "GlobalPreferences.h"
#import "HomeViewController.h"
#import "MyTableViewController.h"
#import "MyCollectionViewController.h"
#import "LoginViewController.h"
#import "MapViewController.h"

@implementation GlobalPreferences

static GlobalPreferences *shared = nil;
+ (id)sharedInstance {
    
    /*
     // Not a threadsafe way to intantiate a singleton class
     if (shared == nil) {
     shared = [[self alloc] init];
     } */
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)setupRootViewController {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"email_id"] == nil) {
        return [self showLogin];
    } else {
        return [self showDashboard];
    }
}

- (UIViewController *)showLogin {
    LoginViewController *objLoginVC = [LoginViewController new];
    return objLoginVC;
}

- (UITabBarController *)showDashboard {
    //     HomeViewController *objHomeVC = [HomeViewController new];
    //     HomeViewController *objHomeVC = [[HomeViewController alloc] init];
    //     HomeViewController *objHomeVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
    HomeViewController *objHomeVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    objHomeVC.title = @"Home";
    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:objHomeVC];
    
    MyTableViewController *objMyTableVC = [[MyTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    objMyTableVC.title = @"My Table";
    UINavigationController *navMyTable = [[UINavigationController alloc] initWithRootViewController:objMyTableVC];
    
    MyCollectionViewController *objMyCollectionVC = [[MyCollectionViewController alloc] initWithNibName:@"MyCollectionViewController" bundle:nil];
    objMyCollectionVC.title = @"Monuments";
    UINavigationController *navCollection = [[UINavigationController alloc] initWithRootViewController:objMyCollectionVC];
    
    MapViewController *objMapVC = [MapViewController new];
    objMapVC.title = @"Maps";
    UINavigationController *navMaps = [[UINavigationController alloc] initWithRootViewController:objMapVC];
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    [tabbarController setViewControllers:@[navHome,navMyTable,navCollection,navMaps]];
    tabbarController.selectedIndex = 3;
    
    return tabbarController;
}

@end
