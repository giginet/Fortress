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
@end

@implementation MainLayer
@synthesize stage;

- (id)init {
  self = [super init];
  if (self) {
    self.stage = [[Stage alloc] initWithID:1];
    scrollPoint_ = CGPointZero;
    [self addChild:self.stage];
    self.stage.anchorPoint = ccp(0, 0);
    self.isTouchEnabled = YES;
  }
  return self;
}

- (void)update:(ccTime)dt {
  [super update:dt];
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
  } else if (x > stageSize.width - screenSize.width) {
    x = stageSize.width - screenSize.width;
  }
  if (y < 0) {
    y = 0;
  } else if (y > stageSize.height - screenSize.height) {
    y = stageSize.height - screenSize.height;
  }
  return ccp(x, y);
}

@end
