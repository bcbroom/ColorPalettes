//
//  PaletteList.h
//  ColorPalettes
//
//  Created by Brian Broom on 8/16/15.
//  Copyright (c) 2015 Brian Broom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Palette.h"

@interface PaletteList : NSObject

@property (copy, readonly, nonatomic) NSArray *palettes;

- (void)refresh;

@end
