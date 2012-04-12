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
@synthesize time;
@synthesize title;
@synthesize player;
@synthesize enemy;

+ (Stage*)currentStage {
  return currentStage_;
}

- (id)initWithID:(NSUInteger)stageId {
  self = [super init];
  if (self) {
    
    NSDictionary* stage = [KKLua loadLuaTableFromFile:@"stage.lua"];
    NSDictionary* info = [stage objectForKey:[NSString stringWithFormat:@"%d", stageId]];
    
    [KKConfig selectKeyPath:@"settings"];
    
    float gravity = [KKConfig floatForKey:@"gravity"];
    if ([info objectForKey:@"gravity"]) {
      gravity = [[info objectForKey:@"gravity"] floatValue];
    }
    
    // Define the simulation accuracy
    self.velocityIterations = 8;
    self.positionIterations = 1;
    self.gravity = ccp(0.0f, gravity);
    
    enemy = [[Fortress alloc] initWithFile:[info objectForKey:@"fortress"]];
    for (Asset* asset in enemy.assets) {
      [self addChild:asset];
    }
  }
  return self;
}

@end
