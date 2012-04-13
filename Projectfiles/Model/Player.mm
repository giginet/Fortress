//
//  Player.m
//  Fortress
//
//  Created by  on 2012/4/13.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Player.h"

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

@end
