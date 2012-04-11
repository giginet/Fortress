//
//  Shooter.h
//  Fortress
//
//  Created by  on 2012/4/11.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "heqet.h"
#import "Bullet.h"
#import "Character.h"

/**
 弾を撃つキャラクターの基底クラスです
 **/

@interface Shooter : Character {
  NSMutableArray* bullets_;
  KWTimer* intervalTimer_;
}

@property(readwrite) float accelerator; // 弾の初速度
@property(readwrite) float interval; // 弾の射出間隔
@property(readwrite) Class bulletClass; // 弾のクラス
@property(readonly) NSArray* bullets; // 撃った弾の一覧
@property(readwrite) NSString* bulletImage; // 弾のファイル名

- (Bullet*)bullet;
- (void)onInterval:(id)sender;
- (Bullet*)shot:(CGPoint)target;

@end
