//
//  UIColor+HexValues.m
//  PalletesTest
//
//  Created by Brian Broom on 8/15/15.
//  Copyright (c) 2015 Brian Broom. All rights reserved.
//

#import "UIColor+HexValues.h"

@implementation UIColor (HexValues)

+ (UIColor *) colorWithRGBHex: (uint32_t)hex
{
  int r = (hex >> 16) & 0xFF;
  int g = (hex >> 8) & 0xFF;
  int b = (hex) & 0xFF;
  
  return [UIColor colorWithRed:r / 255.0f
                         green:g / 255.0f
                          blue:b / 255.0f
                         alpha:1.0f];
}

// Returns a UIColor by scanning the string for a hex number and passing that to +[UIColor colorWithRGBHex:]
// Skips any leading whitespace and ignores any trailing characters
// Added "#" consumer -- via Arnaud Coomans
+ (UIColor *) colorWithHexString: (NSString *)stringToConvert
{
  NSString *string = stringToConvert;
  if ([string hasPrefix:@"#"])
    string = [string substringFromIndex:1];
  
  NSScanner *scanner = [NSScanner scannerWithString:string];
  unsigned hexNum;
  if (![scanner scanHexInt: &hexNum]) return nil;
  return [UIColor colorWithRGBHex:hexNum];
}

@end
