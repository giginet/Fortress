//
//  Stage.m
//  Fortress
//
//  Created by  on 2012/4/12.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Stage.h"

#import "AssetManager.h"
#import "Block.h"
#import "Shooter.h"

static Stage* currentStage_ = nil;

@implementation Stage

+ (Stage*)currentStage {
  return currentStage_;
}

- (id)init {
  self = [super init];
  if (self) {
    currentStage_ = self;
    self.velocityIterations = 8;
    self.positionIterations = 1;
    self.gravity = ccp(0, -180.0f);
    
    Asset* block = [[AssetManager sharedManager] createAssetWithID:@"brick"];
    block.position = ccp(100, 100);
    [self addChild:block];
    
    Asset* block2 = [[AssetManager sharedManager] createAssetWithID:@"brick"];
    block2.position = ccp(400, 110);
    [self addChild:block2];
    
    Asset* shooter = [[AssetManager sharedManager] createAssetWithID:@"shooter"];
    shooter.position = ccp(100, 200);
    [self addChild:shooter];
  }
  return self;
}

@end
