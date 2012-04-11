//
//  MainLayer.m
//  Fortress
//
//  Created by  on 2012/4/11.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "MainLayer.h"
#import "AssetManager.h"
#import "Block.h"

@implementation MainLayer

- (id)init {
  self = [super init];
  if (self) {
    self.velocityIterations = 8;
    self.positionIterations = 1;
    self.gravity = ccp(0, -9.8);
    
    Asset* block = [[AssetManager sharedManager] createAssetWithID:@"brick"];
    block.position = ccp(100, 100);
    block.world = self;
    [self addChild:block];
    
    Asset* shooter = [[AssetManager sharedManager] createAssetWithID:@"shooter"];
    shooter.position = ccp(100, 200);
    shooter.world = self;
    [self addChild:shooter];
  }
  return self;
}

@end
