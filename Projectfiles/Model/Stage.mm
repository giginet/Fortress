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
- (void)addPlayer:(Player*)p;
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
    currentStage_ = self;
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
    
    self.velocityIterations = 8;
    self.positionIterations = 1;
    self.gravity = ccp(0.0f, gravity);
    
    Fortress* playerFortress = [[Fortress alloc] initWithFile:[info objectForKey:@"fortress"]];
    Fortress* enemyFortress = [[Fortress alloc] initWithFile:[info objectForKey:@"fortress"]];
    player = [[Player alloc] initWithID:0 fortress:playerFortress];
    enemy = [[CPUPlayer alloc] initWithID:1 fortress:enemyFortress];
    [self addPlayer:player];
    [self addPlayer:enemy];
    
    self.contentSize = CGSizeMake(width, width);
    
    // Define the ground box shape.
    CCBodySprite* wall = [CCBodySprite node];
    wall.physicsType = kStatic;
    wall.collisionType = kWallCollisionType;
    wall.collidesWithType = kBoxCollisionType;
    [self addChild:wall];
    CGPoint start = ccp(0, 0);
    CGPoint end = ccp(self.width, 10);
    CCArray* bottom = [CCArray arrayWithCapacity:4];
    [bottom addObject:[NSValue valueWithCGPoint:start]];
    [bottom addObject:[NSValue valueWithCGPoint:ccp(end.x, start.y)]];
    [bottom addObject:[NSValue valueWithCGPoint:ccp(end.x, end.y)]];
    [bottom addObject:[NSValue valueWithCGPoint:ccp(start.x, end.y)]];
    [wall addPolygonWithName:@"bottom" withVertices:bottom];
  }
  return self;
}

- (void)addPlayer:(Player *)p {
  /* 
   砦をステージ上に設置します
   プレイヤー0の場合は左端に、プレイヤー1の場合は右端に反転されて設置されます
   @params Fortress* fortress 設置する砦
   @params NSUInteger playerNumber 設置するプレイヤー番号 0 or 1
   @throw プレイヤー番号が0または1以外の時、例外を発生させます
  */
  Fortress* fortress = p.fortress;
  NSUInteger playerId = p.playerId;
  NSAssert(playerId < 2, @"Second argument of addFortress must be less 0 or 1.");
  [KKConfig selectKeyPath:@"settings"];
  float fortressWidth = [KKConfig floatForKey:@"fortressWidth"];
  if (playerId == 0) {
    fortress.center = ccp(fortressWidth / 2, fortressWidth / 2);
    for (Asset* asset in fortress.assets) {
      [self addChild:asset];
    }
  } else {
    float offset = self.width - fortressWidth;
    fortress.center = ccp(fortressWidth / 2 + offset, fortressWidth / 2);
    for (Asset* asset in fortress.assets) {
      float x = offset + fortressWidth - asset.position.x;
      asset.position = ccp(x, asset.position.y);
      asset.scaleX *= -1;
      [self addChild:asset];
    }
  }
}

- (void)update:(ccTime)dt {
  [super update:dt];
  [self.player update:dt];
  [self.enemy update:dt];
}

@end
