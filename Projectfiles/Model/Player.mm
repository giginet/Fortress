//
//  Player.m
//  Fortress
//
//  Created by  on 2012/4/13.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Player.h"
#import "Stage.h"

@implementation Player
@synthesize playerId;
@synthesize fortress;

- (id)initWithID:(NSUInteger)pId fortress:(Fortress *)fs {
  self = [super init];
  if (self) {
    playerId = pId;
    fortress = fs;
  }
  return self;
}

- (void)update:(ccTime)dt {
}

- (Player*)enemyPlayer {
  NSUInteger enemy = (playerId + 1) % 2;
  Stage* stage = [Stage currentStage];
  if (enemy == 0) {
    return stage.player;
  } else {
    return stage.enemy;
  }
}

@end
