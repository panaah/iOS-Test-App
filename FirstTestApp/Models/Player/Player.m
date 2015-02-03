//
//  Player.m
//  FirstTestApp
//
//  Created by Thakur VJ on 14/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import "Player.h"

@implementation Player

- (void)fillPlayerInfo:(NSDictionary *)dictPlayer {
    self.playerName = [dictPlayer valueForKey:@"playerName"];
    self.playerDescription = [dictPlayer valueForKey:@"playerDescription"];
    self.playerImage = [dictPlayer valueForKey:@"playerImage"];
    if (self.playerImage == nil) {
        self.playerImage = @"default_player_image.png";
    }
    self.players = [NSMutableArray new];
    for (int i = 0; i < 6; i++) {
        [self.players addObject:self];
    }
}

@end
