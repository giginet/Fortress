//
//  Character.h
//  Fortress
//
//  Created by  on 2012/4/10.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Asset.h"

/*
 Assetのうち、兵士に相当するパーツの基底クラスです。
 兵士は重力の影響を受け、各々攻撃します。
 HPがなくなったり、画面外に出ると死亡します
 */

@interface Character : Asset

@end
