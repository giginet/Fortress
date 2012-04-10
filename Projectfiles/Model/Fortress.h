//
//  Fortress.h
//  Fortress
//
//  Created by  on 2012/4/9.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 FortressはAssetの集合を扱うクラスです。
 Fortressをエンコードしたりデコードしたりできるようにする予定
 */

@interface Fortress : NSObject {
  NSMutableArray* assets_;
}

@property(readonly) NSArray* assets;

@end
