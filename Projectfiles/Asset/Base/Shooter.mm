//
//  Shooter.m
//  Fortress
//
//  Created by  on 2012/4/11.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Shooter.h"

@implementation Shooter
@synthesize interval;
@synthesize accelerator;
@synthesize bulletClass;
@synthesize bullets = bullets_;
@synthesize bulletImage;

- (id)initWithDictionary:(NSDictionary *)info {
  self = [super initWithDictionary:info];
  if (self) {
    accelerator = [[info objectForKey:@"acceletor"] floatValue];
    interval = [[info objectForKey:@"interval"] floatValue];
    bulletClass = NSClassFromString([info objectForKey:@"bulletClass"]);
    bullets_ = [NSMutableArray array];
    bulletImage = [info objectForKey:@"bulletImage"];
    intervalTimer_ = [KWTimer timerWithMax:interval];
    intervalTimer_.looping = YES;
    [intervalTimer_ setOnCompleteListener:self selector:@selector(onInterval:)];
  }
  return self;
}

- (void)onEnterTransitionDidFinish {
  [intervalTimer_ play];
}

- (Bullet*)bullet {
  /*
   射出用の弾を取り出します
   サブクラスでオーバーライドして使います
   @return Bullet*
  */
  Bullet* bullet = [self.bulletClass spriteWithFile:self.bulletImage];
  return bullet;
}

- (void)onInterval:(id)sender {
  /*
   self.intervalごとに実行されます。
   主に弾を撃ちます
   @params id sender
  */
  [self shot:self.target];
}

- (Bullet*)shot:(CGPoint)target {
  /*
   targetに向かって弾を撃ちます。
   射出された弾を返します。
   @params CGPoint target
   @return Bullet*
  */
  Bullet* bullet = [self bullet];
  float x = 0, y = 0;
  if (target.x == self.position.x) {
    y = self.accelerator;
  } else {
    float rad = atan2((target.y - self.position.y), (target.x - self.position.x));
    x = self.accelerator * cos(rad);
    y = self.accelerator * sin(rad);
  }
  int px = (self.contentSize.height + bullet.contentSize.width) / 2;
  int py = (self.contentSize.height + bullet.contentSize.width) / 2;
  if (x < 0) px *= -1;
  if (y < 0) py *= -1;
  bullet.position = ccpAdd(self.position, ccp(px, py));
  bullet.velocity = ccp(x, y);
  bullet.shooter = self;
  bullet.world = self.world;
  [self.parent addChild:bullet];
  return bullet;
}

@end
