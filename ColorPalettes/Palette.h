//
//  Palette.h
//  ColorPalettes
//
//  Created by Brian Broom on 8/16/15.
//  Copyright (c) 2015 Brian Broom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Palette : NSObject

@property (copy, readonly, nonatomic) NSArray *colors;
@property (copy, readonly, nonatomic) NSString *title;

- (instancetype)initWithJSONData:(NSDictionary *)data;

@end
