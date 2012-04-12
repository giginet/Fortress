//
//  Bullet.m
//  Fortress
//
//  Created by  on 2012/4/12.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet
@synthesize shooter;

- (id)initWithFile:(NSString *)filename {
  self = [super initWithFile:filename];
  if (self) {
    self.physicsType = kDynamic;
    self.collisionType = kBoxCollisionType;
    self.collidesWithType = kBoxCollisionType | kWallCollisionType;
    self.density = 1.0f;
    self.friction = 0.3f;
    [self addCircleWithName:@"circle"];
  }
  return self;
}

- (void)update:(ccTime)dt {
  [super update:dt];
  if(self.position.x < 0 || self.position.y < 0) {
    [self.parent removeChild:self cleanup:YES];
  }
}

- (void)onOverlapBody:(CCBodySprite *)sprite {
  if ([sprite isKindOfClass:[Asset class]] && sprite != self.shooter) {
    Asset* asset = (Asset*)sprite;
    [asset damage:1 attacker:self];
  }
}

@end
