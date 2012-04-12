//
//  Asset.m
//  Fortress
//
//  Created by  on 2012/4/10.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Asset.h"
#import "Stage.h"

@implementation Asset
@synthesize hp;
@synthesize maxHp;
@synthesize cost;
@synthesize name;
@synthesize assetId;

- (id)init {
  self = [super init];
  if (self) {
    hp = 0;
    maxHp = 0;
    cost = 0;
    name = @"";
    self.physicsType = kDynamic;
    self.collisionType = kBoxCollisionType;
    self.collidesWithType = kBoxCollisionType | kWallCollisionType;
    float fps = [[KKStartupConfig config] maxFrameRate];
    [self schedule:@selector(update:) interval:1.0 / fps];
  }
  return self;
}

- (void)onEnter {
  [super onEnter];
  self.world = [Stage currentStage];
}

- (id)initWithDictionary:(NSDictionary *)info {
  NSString* filename = [info objectForKey:@"image"];
  self = [self initWithFile:filename];
  if (self) {
    [self setTexture:[[CCTextureCache sharedTextureCache] addImage:filename]];
    maxHp = [[info objectForKey:@"hp"] intValue];
    hp = maxHp;
    cost = [[info objectForKey:@"cost"] intValue];
    name = [info objectForKey:@"name"];
    assetId = [info objectForKey:@"assetId"];
    [self addBoxWithName:assetId];
  }
  return self;
}

- (void)damage:(int)damage attacker:(CCBodySprite *)attacker {
  self.hp -= damage;
}

- (void)update:(ccTime)dt {
  [super update:dt];
}

@end
