//
//  Fortress.m
//  Fortress
//
//  Created by  on 2012/4/9.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Fortress.h"
#import "Stage.h"
#import "Asset.h"
#import "AssetManager.h"

@implementation Fortress
@synthesize assets = assets_;
@synthesize center;

- (id)initWithFile:(NSString *)filename {
  self = [super init];
  if (self) {
    assets_ = [NSMutableArray array];
    NSDictionary* info = [KKLua loadLuaTableFromFile:filename];
    
    for(NSDictionary* assetInfo in [info allValues]) {
      NSString* assetId = [assetInfo objectForKey:@"assetId"];
      int x = [[(NSDictionary*)[assetInfo objectForKey:@"position"] objectForKey:[NSString stringWithFormat:@"%d", 1]] intValue];
      int y = [[(NSDictionary*)[assetInfo objectForKey:@"position"] objectForKey:[NSString stringWithFormat:@"%d", 2]] intValue];
      Asset* asset = [[AssetManager sharedManager] createAssetWithID:assetId];
      asset.position = ccp(x, y);
      [assets_ addObject:asset];
    }
  }
  return self;
}

@end
