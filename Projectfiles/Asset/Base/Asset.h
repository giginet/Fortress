//
//  Asset.h
//  Fortress
//
//  Created by  on 2012/4/10.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CCBodySprite.h"
#import "Fortress.h"

/* 
 砦に設置するパーツの基底クラスです。
 全て物理演算されます。
*/

enum {
  kBoxCollisionType = 1,
  kWallCollisionType = 2
};

@interface Asset : CCBodySprite {
}

@property(readwrite) int hp;
@property(readonly) int maxHp;
@property(readonly) int cost;
@property(readwrite) CGPoint target;
@property(readwrite) NSString* name;
@property(readonly) NSString* assetId;
@property(readwrite, weak) Fortress* fortress;

- (id)initWithDictionary:(NSDictionary*)info;
- (void)damage:(int)damage attacker:(CCBodySprite*)attacker;
- (void)update:(ccTime)dt;

@end
