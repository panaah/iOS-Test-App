//
//  Player.h
//  FirstTestApp
//
//  Created by Thakur VJ on 14/01/15.
//  Copyright (c) 2015 Thakur VJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property(nonatomic, strong)NSString *playerName;
@property(nonatomic, strong)NSString *playerDescription;
@property(nonatomic, strong)NSString *playerImage;

@property(nonatomic, strong)NSMutableArray *players;

- (void)fillPlayerInfo:(NSDictionary *)dictPlayer;

@end
