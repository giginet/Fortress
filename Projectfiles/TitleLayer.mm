//
//  TitleLayer.m
//  Fortress
//
//  Created by  on 2012/4/13.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "TitleLayer.h"
#import "MainLayer.h"

@implementation TitleLayer

- (id)init {
  self = [super init];
  if (self) {
    CGPoint screenCenter = [CCDirector sharedDirector].screenCenter;
    CCLabelTTF* title = [CCLabelTTF labelWithString:@"Fortress" 
                                           fontName:@"Arial-BoldMT" 
                                           fontSize:72];
    title.position = ccp(screenCenter.x, screenCenter.y * 1.25);
    [self addChild:title];
    
    CCLabelTTF* touch = [CCLabelTTF labelWithString:@"touch to start" 
                                           fontName:@"Arial-BoldMT" 
                                           fontSize:24];
    touch.position = ccp(screenCenter.x, screenCenter.y * 0.5);
    [self addChild:touch];
    
    self.isTouchEnabled = YES;
  }
  return self;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  CCScene* scene = [MainLayer nodeWithScene];
  [[CCDirector sharedDirector] pushScene:scene];
  return YES;
}

@end
