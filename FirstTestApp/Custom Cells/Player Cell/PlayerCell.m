//
//  PlayerCell.m
//  FirstTestApp
//
//  Created by Thakur VJ on 15/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "PlayerCell.h"

@implementation PlayerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupPlayerCellFor:(Player *)objPlayer {
    self.lblPlayerName.text = objPlayer.playerName;
    self.lblPlayerDesc.text = objPlayer.playerDescription;
    self.imgPlayer.image = [UIImage imageNamed:objPlayer.playerImage];
    
}

@end
