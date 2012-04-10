//
//  AssetManager.h
//  Fortress
//
//  Created by  on 2012/4/10.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Asset.h"

/*
 設定ファイルなどからAssetの情報を読み込んでAssetを生成するクラスです
 */

@interface AssetManager : NSObject {
  NSDictionary* assetInfo_;
}

+ (id)sharedManager;
- (Asset*)createAssetWithID:(NSUInteger)assetId;

@end
