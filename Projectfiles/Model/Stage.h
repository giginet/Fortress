//
//  Stage.h
//  Fortress
//
//  Created by  on 2012/4/12.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CCWorldLayer.h"
#import "Fortress.h"

@interface Stage : CCWorldLayer

@property(readwrite) int time;
@property(readwrite, copy) NSString* title;
@property(readonly, strong) Fortress* player;
@property(readonly, strong) Fortress* enemy;

+ (Stage*)currentStage;

- (id)initWithID:(NSUInteger)stageId;

@end
