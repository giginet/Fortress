//
//  CPUPlayer.m
//  Fortress
//
//  Created by  on 2012/4/13.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CPUPlayer.h"

@implementation CPUPlayer

- (void)update:(ccTime)dt {
  CGPoint target = [self enemyPlayer].fortress.center;
  [self.fortress setTarget:target];
}

@end
