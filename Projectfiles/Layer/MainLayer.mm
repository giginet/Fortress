//
//  MainLayer.m
//  Fortress
//
//  Created by  on 2012/4/11.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "MainLayer.h"
#import "Stage.h"

@implementation MainLayer

- (id)init {
  self = [super init];
  if (self) {
    Stage* stage = [[Stage alloc] initWithID:1];
    [self addChild:stage];
  }
  return self;
}

@end
