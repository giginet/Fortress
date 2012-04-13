//
//  MainLayer.m
//  Fortress
//
//  Created by  on 2012/4/11.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "MainLayer.h"
#import "Stage.h"

@interface MainLayer()
- (CGPoint)scrollLayer:(CGPoint)scrollPoint;
- (float)scaleLayer;
@end

@implementation MainLayer
@synthesize stage;
@synthesize stageScale;

- (id)init {
  self = [super init];
  if (self) {
    
    CGSize screen = [CCDirector sharedDirector].screenSize;
    CCLayerColor* bg = [CCLayerColor layerWithColor:ccc4(0, 255, 255, 255) 
                                              width:screen.width 
                                             height:screen.height];
    [self addChild:bg];
    
    self.stage = [[Stage alloc] initWithID:1];
    self.stageScale = 1.0;
    scrollPoint_ = CGPointZero;
    [self addChild:self.stage];
    self.stage.anchorPoint = ccp(0, 0);
    self.isTouchEnabled = YES;
  }
  return self;
}

- (void)update:(ccTime)dt {
  [super update:dt];
  [self scaleLayer];
  scrollPoint_ = [self scrollLayer:scrollPoint_];
  self.stage.position = ccpMult(scrollPoint_, -1);
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  lastTouchPoint_ = [self convertTouchToNodeSpace:touch];
  return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
  CGPoint current = [self convertTouchToNodeSpace:touch];
  scrollPoint_ = ccpAdd(scrollPoint_, ccpSub(lastTouchPoint_, current));
  lastTouchPoint_ = current;
}

- (CGPoint)scrollLayer:(CGPoint)scrollPoint {
  float x = scrollPoint.x;
  float y = scrollPoint.y;
  CGSize screenSize = [CCDirector sharedDirector].screenSize;
  CGSize stageSize = self.stage.contentSize;
  if (x < 0) {
    x = 0;
  } else if (x > stageSize.width * stageScale - screenSize.width) {
    x = stageSize.width * stageScale - screenSize.width;
  }
  if (y < 0) {
    y = 0;
  } else if (y > stageSize.height * stageScale - screenSize.height) {
    y = stageSize.height * stageScale - screenSize.height;
  }
  return ccp(x, y);
}

- (float)scaleLayer {
  KKInput* input = [KKInput sharedInput];
  input.gesturePinchEnabled = YES;
  if (input.gesturePinchBegan) {
    if ((input.gesturePinchScale <= 1.0 && stageScale >= input.gesturePinchScale) || 
        (input.gesturePinchScale >= 1.0 && stageScale <= input.gesturePinchScale)) {
      stageScale *= 1.0 + ((input.gesturePinchScale - 1.0) / 5.0);
    }
    CGSize screenSize = [CCDirector sharedDirector].screenSize;
    CGSize stageSize = self.stage.contentSize;
    float minScale = screenSize.width / stageSize.width;
    if (stageScale > 1.0) {
      stageScale = 1.0;
    } else if (stageScale < minScale) {
      stageScale = minScale;
    }
    self.stage.scale = stageScale;
  }
  return stageScale;
}

@end
