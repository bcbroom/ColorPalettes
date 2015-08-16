//
//  UIColor+HexValues.h
//  PalletesTest
//
//  Created by Brian Broom on 8/15/15.
//  Copyright (c) 2015 Brian Broom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexValues)

+ (UIColor *) colorWithHexString: (NSString *)stringToConvert;
+ (UIColor *) colorWithRGBHex: (uint32_t)hex;

@end
