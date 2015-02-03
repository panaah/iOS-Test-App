//
//  MyCollectionViewController.m
//  FirstTestApp
//
//  Created by Thakur VJ on 15/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "FullScreenViewController.h"

@interface MyCollectionViewController ()
{
    NSMutableArray *arrImages, *arrToDeleteItems;
    BOOL isEditing;
}
@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    arrImages = [NSMutableArray array];
//    arrImages = [NSMutableArray new];
    arrToDeleteItems = [NSMutableArray array];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    UIButton *edit = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 65, 44)];
    [edit addTarget:self action:@selector(editClicked:) forControlEvents:UIControlEventTouchUpInside];
    [edit setTitle:@"Edit" forState:UIControlStateNormal];
    [edit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [edit.titleLabel setFont:[UIFont fontWithName:@"Helvetica-bold" size:18]];
    [edit setTag:1];
    UIBarButtonItem *btnEdit = [[UIBarButtonItem alloc] initWithCustomView:edit];
    self.navigationItem.rightBarButtonItem = btnEdit;
    
    [self loadImages];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Custom
- (void)editClicked:(UIButton *)sender {
    if (sender.tag == 1) { // edit
        NSLog(@"Im Edit.");
//        sender.tag = 2;
        [sender setTag:2];
        isEditing = YES;
        [sender setTitle:@"Delete" forState:UIControlStateNormal];
    } else {
        NSLog(@"Im Delete.");
        // update the data source
        for (NSIndexPath *path in arrToDeleteItems) {
            [arrImages removeObjectAtIndex:path.item];
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:path];
            [self showBorderForCell:cell borderColor:[UIColor clearColor] borderWidth:2];
        }
        
        [self.collectionView deleteItemsAtIndexPaths:arrToDeleteItems];

        // clear all objects from this array as well.
        [arrToDeleteItems removeAllObjects];
        
        // reset the view
        [sender setTag:1];
        isEditing = NO;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
    }
}

- (void)loadImages {
    NSLog(@"arrImages.count = %ld",arrImages.count);
    NSArray *arrrayImages = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:nil];
    for (NSString *path in arrrayImages) {
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [arrImages addObject:image];
    }
    NSLog(@"arrImages.count = %ld",arrImages.count);

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete method implementation -- Return the number of items in the section
    return arrImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    
    UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:-1];
    if (imgView == nil) {
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        imgView.tag = -1;
        [cell.contentView addSubview:imgView];
    }
    imgView.image = [arrImages objectAtIndex:indexPath.item];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/


// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return YES;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
//    NSLog(@"action = %@",action);
    if (action == @selector(cut:)) {
        [arrImages removeObjectAtIndex:indexPath.item];
        [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (isEditing) {
        NSLog(@"do edit");
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        if (![arrToDeleteItems containsObject:indexPath]) {
            [arrToDeleteItems addObject:indexPath];
            [self showBorderForCell:cell borderColor:[UIColor blueColor] borderWidth:2];
        } else {
            [arrToDeleteItems removeObject:indexPath];
            [self showBorderForCell:cell borderColor:[UIColor clearColor] borderWidth:2];
        }
    } else {
        [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
        FullScreenViewController *objFullScreenVC = [FullScreenViewController new];
        objFullScreenVC.thumbImage = [arrImages objectAtIndex:indexPath.item];
        [self.navigationController pushViewController:objFullScreenVC animated:YES];
    }
}

- (void)showBorderForCell:(UICollectionViewCell *)cell borderColor:(UIColor *)color borderWidth:(CGFloat)width {
    cell.layer.borderColor = color.CGColor;
    cell.layer.borderWidth = width;
    
}

@end
