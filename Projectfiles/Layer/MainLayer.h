//
//  MainLayer.h
//  Fortress
//
//  Created by  on 2012/4/11.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "heqet.h"
#import "Stage.h"

@interface MainLayer : KWLayer {
  CGPoint scrollPoint_;
  CGPoint lastTouchPoint_;
}

@property(readwrite) float stageScale;
@property(readwrite, strong) Stage* stage;

@end
