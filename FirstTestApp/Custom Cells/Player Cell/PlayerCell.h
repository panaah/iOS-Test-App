//
//  PlayerCell.h
//  FirstTestApp
//
//  Created by Thakur VJ on 15/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface PlayerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgPlayer;
@property (weak, nonatomic) IBOutlet UILabel *lblPlayerName;
@property (weak, nonatomic) IBOutlet UILabel *lblPlayerDesc;

- (void)setupPlayerCellFor:(Player *)objPlayer;

@end
