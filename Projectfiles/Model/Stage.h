//
//  Stage.h
//  Fortress
//
//  Created by  on 2012/4/12.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CCWorldLayer.h"
#import "CPUPlayer.h"
#import "Fortress.h"

@interface Stage : CCWorldLayer

@property(readwrite) int time;
@property(readwrite) float width;
@property(readwrite, copy) NSString* title;
@property(readonly, strong) Player* player;
@property(readonly, strong) CPUPlayer* enemy;

+ (Stage*)currentStage;

- (id)initWithID:(NSUInteger)stageId;

@end
