//
//  EditLayer.m
//  Fortress
//
//  Created by  on 2012/4/9.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "EditLayer.h"

@interface EditLayer()
- (void)createPolygonSprite:(CGPoint)start end:(CGPoint)end;
@end

// enums that will be used as tags
enum {
  kTagTileMap = 1,
  kTagBatchNode = 1,
  kTagAnimation1 = 1,
};

enum {
  kBoxCollisionType = 1,
  kWallCollisionType = 2
};

// HelloWorldLayer implementation
@implementation EditLayer

// on "init" you need to initialize your instance
-(id) init
{
  // always call "super" init
  // Apple recommends to re-assign "self" with the "super" return value
  if( (self=[super init])) {
    
    // enable touches
    self.isTouchEnabled = YES;
    
    // enable accelerometer
    self.isAccelerometerEnabled = YES;
    
    CGSize screenSize = [CCDirector sharedDirector].screenSize;
    
    // Define the gravity vector.
    self.gravity = ccp(0.0f, -320.0f);
    
    // Define the simulation accuracy
    self.velocityIterations = 8;
    self.positionIterations = 1;
    
    [self createPolygonSprite:ccp(0, 0) end:ccp(screenSize.width, 20)];
    [self createPolygonSprite:ccp(0, screenSize.height - 20) end:ccp(screenSize.width, screenSize.height)];
    [self createPolygonSprite:ccp(0, 0) end:ccp(20, screenSize.height)];
    [self createPolygonSprite:ccp(screenSize.width - 20, 0) end:ccp(screenSize.width, screenSize.height)];
    
    // Set up sprite
    _lastBox = nil;
    
    CCSpriteBatchNode *batch = [CCSpriteBatchNode batchNodeWithFile:@"blocks.png" capacity:150];
    [self addChild:batch z:0 tag:kTagBatchNode];
    
    [self addNewSpriteWithCoords:ccp(screenSize.width/2, screenSize.height/2)];
  }
  return self;
}

-(void) addNewSpriteWithCoords:(CGPoint)p
{
  CCLOG(@"Add sprite %0.2f x %02.f",p.x,p.y);
  CCSpriteBatchNode *batch = (CCSpriteBatchNode*) [self getChildByTag:kTagBatchNode];
  
  //We have a 64x64 sprite sheet with 4 different 32x32 images.  The following code is
  //just randomly picking one of the images
  int idx = (CCRANDOM_0_1() > .5 ? 0:1);
  int idy = (CCRANDOM_0_1() > .5 ? 0:1);
  CCBodySprite *sprite = [CCBodySprite spriteWithBatchNode:batch rect:CGRectMake(32 * idx,32 * idy,32,32)];
  sprite.world = self;
  sprite.physicsType = kDynamic;
  sprite.collisionType = kBoxCollisionType;
  sprite.collidesWithType = kBoxCollisionType | kWallCollisionType;
  sprite.position = ccp(p.x, p.y);
  sprite.density = 1.0f;
  sprite.friction = 0.3f;
  [sprite addBoxWithName:@"box"];
  [batch addChild:sprite];
  
  // if another box exists
  if (_lastBox)
    {
    // add a spring between this and the last box!
    //CCSpringSprite *spring = [CCSpringSprite spriteWithFile:@"Icon-Small.png"];
    //[spring setBody:_lastBox andBody:sprite];
    //spring.length = 32;
    //[self addChild:spring];
    
    // or add a motor!
    //CCMotorSprite *motor = [CCMotorSprite spriteWithFile:@"Icon-Small.png"];
    //[motor setBody:_lastBox andBody:sprite];
    //motor.running = YES;
    //motor.speed = 100;
    //motor.power = 100;
    //[self addChild:motor];
    }
  
  // save this as the last box
  _lastBox = sprite;
}

- (void)createPolygonSprite:(CGPoint)start end:(CGPoint)end {
  // Define the ground box shape.
  CCBodySprite* wall = [CCBodySprite node];
  wall.physicsType = kStatic;
  wall.collisionType = kWallCollisionType;
  wall.collidesWithType = kBoxCollisionType;
  [self addChild:wall];
  CCArray* bottom = [CCArray arrayWithCapacity:4];
  [bottom addObject:[NSValue valueWithCGPoint:start]];
  [bottom addObject:[NSValue valueWithCGPoint:ccp(end.x, start.y)]];
  [bottom addObject:[NSValue valueWithCGPoint:ccp(end.x, end.y)]];
  [bottom addObject:[NSValue valueWithCGPoint:ccp(start.x, end.y)]];
  [wall addPolygonWithName:@"bottom" withVertices:bottom];
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  //Add a new body/atlas sprite at the touched location
  for( UITouch *touch in touches ) {
    CGPoint location = [touch locationInView: [touch view]];
    
    location = [[CCDirector sharedDirector] convertToGL: location];
    
    [self addNewSpriteWithCoords: location];
  }
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{	
  static float prevX=0, prevY=0;
  
  //#define kFilterFactor 0.05f
#define kFilterFactor 1.0f	// don't use filter. the code is here just as an example
  
  float accelX = (float) acceleration.x * kFilterFactor + (1- kFilterFactor)*prevX;
  float accelY = (float) acceleration.y * kFilterFactor + (1- kFilterFactor)*prevY;
  
  prevX = accelX;
  prevY = accelY;
  
  // accelerometer values are in "Portrait" mode. Change them to Landscape left
  // multiply the gravity by 10
  [self setGravity:CGPointMake(-accelY * 320, accelX * 320)];
}

@end
