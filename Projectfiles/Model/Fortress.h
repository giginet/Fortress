//
//  Fortress.h
//  Fortress
//
//  Created by  on 2012/4/9.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "heqet.h"
#import "CCBox2D.h"

/*
 FortressはAssetの集合を扱うクラスです。
 Fortressをエンコードしたりデコードしたりできるようにする予定
 */

@interface Fortress : NSObject {
  NSMutableArray* assets_;
}

@property(readwrite) CGPoint center;
@property(readonly, strong) NSArray* assets;

- (id)initWithFile:(NSString*)filename;

- (void)setTarget:(CGPoint)target;

@end
