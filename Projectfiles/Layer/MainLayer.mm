//
//  MainLayer.m
//  Fortress
//
//  Created by  on 2012/4/11.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "MainLayer.h"

@implementation MainLayer

- (id)init {
  self = [super init];
  if (self) {
    self.velocityIterations = 8;
    self.positionIterations = 1;
    self.gravity = ccp(0, -9.8);
  }
  return self;
}

@end
