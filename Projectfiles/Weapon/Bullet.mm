//
//  Bullet.m
//  Fortress
//
//  Created by  on 2012/4/12.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet

- (id)initWithFile:(NSString *)filename {
  self = [super initWithFile:@"bullet.png"];
  if (self) {
  }
  return self;
}

- (void)update:(ccTime)dt {
  [super update:dt];
  if(self.position.x < 0 || self.position.y < 0) {
    [self.parent removeChild:self cleanup:YES];
  }
}

@end
