//
//  Asset.h
//  Fortress
//
//  Created by  on 2012/4/10.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CCBodySprite.h"

/* 
 砦に設置するパーツの基底クラスです。
 全て物理演算されます。
*/

@interface Asset : CCBodySprite {
}

@property(readwrite) int hp;
@property(readonly) int maxHp;
@property(readonly) int cost;
@property(readwrite) NSString* name;

- (id)initWithDictionary:(NSDictionary*)info;

@end
