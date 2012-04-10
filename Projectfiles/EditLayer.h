//
//  EditLayer.h
//  Fortress
//
//  Created by  on 2012/4/9.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "heqet.h"
#import "CCBox2D.h"

@interface EditLayer : CCWorldLayer {
  CCBodySprite *_lastBox;
}

-(void) addNewSpriteWithCoords:(CGPoint)p;

@end