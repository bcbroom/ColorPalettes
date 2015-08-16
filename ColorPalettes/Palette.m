//
//  Palette.m
//  ColorPalettes
//
//  Created by Brian Broom on 8/16/15.
//  Copyright (c) 2015 Brian Broom. All rights reserved.
//

#import "Palette.h"
#import "UIColor+HexValues.h"

@implementation Palette

- (instancetype)initWithJSONData:(NSDictionary *)data {
  self = [super init];
  if (self) {
    _title = data[@"title"];
    NSMutableArray *colorsToAdd = [NSMutableArray new];
    
    for (NSString *hexColorString in data[@"colors"]) {
      [colorsToAdd addObject:[UIColor colorWithHexString:hexColorString]];
    }
    
    _colors = [colorsToAdd copy];
  }
  return self;
}

@end
