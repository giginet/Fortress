//
//  Bullet.h
//  Fortress
//
//  Created by  on 2012/4/12.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CCBodySprite.h"

/**
 弾の基底クラスです。
 砲弾、矢、レーザーなど飛ぶ物全般はこれのサブクラスです
 **/

@interface Bullet : CCBodySprite

- (void)update:(ccTime)dt;

@end
