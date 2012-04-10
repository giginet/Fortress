//
//  Asset.m
//  Fortress
//
//  Created by  on 2012/4/10.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Asset.h"

@implementation Asset
@synthesize hp;
@synthesize maxHp;
@synthesize cost;
@synthesize name;

- (id)init {
  self = [super init];
  if (self) {
    hp = 0;
    maxHp = 0;
    cost = 0;
    name = @"";
  }
  return self;
}

- (id)initWithDictionary:(NSDictionary *)info {
  self = [self init];
  if (self) {
  }
  return self;
}

- (void)damage:(int)damage attacker:(CCBodySprite *)attacker {
}

@end
