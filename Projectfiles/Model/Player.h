//
//  Player.h
//  Fortress
//
//  Created by  on 2012/4/13.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fortress.h"

@interface Player : NSObject {
}

@property(readonly) NSUInteger playerId;
@property(readwrite, strong) Fortress* fortress; 

- (id)initWithID:(NSUInteger)playerId fortress:(Fortress*)fortress;
- (void)update:(ccTime)dt;
- (Player*)enemyPlayer;

@end
