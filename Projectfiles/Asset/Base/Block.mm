//
//  Block.m
//  Fortress
//
//  Created by  on 2012/4/10.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Block.h"

@implementation Block

- (id)initWithDictionary:(NSDictionary *)info {
  self = [super initWithDictionary:info];
  if (self) {
    self.physicsType = kKinematic;
  }
  return self;
}

@end
