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
    
    Asset* block = [[AssetManager sharedManager] createAssetWithID:1];
    block.position = ccp(100, 100);
    [self addChild:block];
  }
  return self;
}

@end
