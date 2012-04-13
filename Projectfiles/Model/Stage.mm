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

@interface Stage()
- (void)addFortress:(Fortress*)fortress player:(NSUInteger)playerNumber;
@end

@implementation Stage
@synthesize time;
@synthesize width;
@synthesize title;
@synthesize player;
@synthesize enemy;

+ (Stage*)currentStage {
  return currentStage_;
}

- (id)initWithID:(NSUInteger)stageId {
  self = [super init];
  if (self) {
    CGSize screen = [CCDirector sharedDirector].screenSize;
    
    NSDictionary* stage = [KKLua loadLuaTableFromFile:@"stage.lua"];
    NSDictionary* info = [stage objectForKey:[NSString stringWithFormat:@"%d", stageId]];
    
    [KKConfig selectKeyPath:@"settings"];
    
    float gravity = [KKConfig floatForKey:@"gravity"];
    if ([info objectForKey:@"gravity"]) {
      gravity = [[info objectForKey:@"gravity"] floatValue];
    }
    width = screen.width;
    if ([info objectForKey:@"width"]) {
      width = [[info objectForKey:@"width"] floatValue];
    }
    
    // Define the simulation accuracy
    self.velocityIterations = 8;
    self.positionIterations = 1;
    self.gravity = ccp(0.0f, gravity);
    
    enemy = [[Fortress alloc] initWithFile:[info objectForKey:@"fortress"]];
    [self addFortress:enemy player:1];

    self.contentSize = CGSizeMake(width, width);
  }
  return self;
}

- (void)addFortress:(Fortress *)fortress player:(NSUInteger)playerNumber {
  /* 
   砦をステージ上に設置します
   プレイヤー0の場合は左端に、プレイヤー1の場合は右端に反転されて設置されます
   @params Fortress* fortress 設置する砦
   @params NSUInteger playerNumber 設置するプレイヤー番号 0 or 1
   @throw プレイヤー番号が0または1以外の時、例外を発生させます
  */
  NSAssert(playerNumber < 2, @"Second argument of addFortress must be less 0 or 1.");
  if (playerNumber == 0) {
    for (Asset* asset in enemy.assets) {
      [self addChild:asset];
    }
  } else {
    [KKConfig selectKeyPath:@"settings"];
    float fortressWidth = [KKConfig floatForKey:@"fortressWidth"];
    float offset = self.width - fortressWidth;
    for (Asset* asset in enemy.assets) {
      float x = offset + fortressWidth - asset.position.x;
      asset.position = ccp(x, asset.position.y);
      [self addChild:asset];
    }
  }
}

@end
