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
  [self shot:CGPointZero];
}

- (Bullet*)shot:(CGPoint)target {
  /*
   targetに向かって弾を撃ちます。
   射出された弾を返します。
   @params CGPoint target
   @return Bullet*
   */
  Bullet* bullet = [self bullet];
  bullet.position = self.position;
  bullet.velocity = ccp(self.accelerator, 0);
  bullet.shooter = self;
  bullet.world = self.world;
  [self.parent addChild:bullet];
  return bullet;
}

@end
