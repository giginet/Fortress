//
//  Stage.m
//  Fortress
//
//  Created by  on 2012/4/12.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Stage.h"

#import "AssetManager.h"
#import "Block.h"
#import "Shooter.h"

static Stage* currentStage_ = nil;

@implementation Stage

+ (Stage*)currentStage {
  return currentStage_;
}

- (id)initWithFile:(NSString *)filename {
  self = [super init];
  if (self) {
    currentStage_ = self;
    NSDictionary* info = [KKLua loadLuaTableFromFile:filename];
    
    self.velocityIterations = 8;
    self.positionIterations = 1;
    self.gravity = ccp(0, -180.0f);
    
    for(NSDictionary* assetInfo in [info allValues]) {
      NSString* assetId = [assetInfo objectForKey:@"assetId"];
      int x = [[(NSDictionary*)[assetInfo objectForKey:@"position"] objectForKey:[NSString stringWithFormat:@"%d", 1]] intValue];
      int y = [[(NSDictionary*)[assetInfo objectForKey:@"position"] objectForKey:[NSString stringWithFormat:@"%d", 2]] intValue];
      Asset* asset = [[AssetManager sharedManager] createAssetWithID:assetId];
      asset.position = ccp(x, y);
      [self addChild:asset];
    }
  }
  return self;
}

@end
