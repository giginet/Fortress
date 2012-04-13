//
//  Core.m
//  Fortress
//
//  Created by  on 2012/4/13.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Core.h"

@implementation Core

- (id)initWithDictionary:(NSDictionary *)info {
  self = [super initWithDictionary:info];
  if (self) {
    self.physicsType = kKinematic;
  }
  return self;
}

@end
