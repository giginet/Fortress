//
//  AssetManager.m
//  Fortress
//
//  Created by  on 2012/4/10.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "AssetManager.h"

@implementation AssetManager

+ (id)sharedManager {
  static id sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[[self class] alloc] init];
  });
  return sharedInstance;
}

- (id)init {
  self = [super init];
  if (self) {
    assetInfo_ = [KKLua loadLuaTableFromFile:@"assets.lua"];
  }
  return self;
}

- (Asset*)createAssetWithID:(NSUInteger)assetId {
  NSDictionary* info = [assetInfo_ objectForKey:[NSString stringWithFormat:@"%d", assetId]];
  NSString* className = [info objectForKey:@"className"];
  Class cls = NSClassFromString(className);
  return [[cls alloc] initWithDictionary:info];
}

@end
