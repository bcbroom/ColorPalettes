//
//  PaletteDetailViewController.m
//  ColorPalettes
//
//  Created by Brian Broom on 8/16/15.
//  Copyright (c) 2015 Brian Broom. All rights reserved.
//

#import "PaletteDetailViewController.h"

@interface PaletteDetailViewController ()

@end

@implementation PaletteDetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self drawColorRects];
}

- (void)drawColorRects {
  CGRect largeRect = self.view.bounds;
  CGRect sliceRect;
  CGRect leftoverRect;
  
  for (UIColor *color in self.selectedPalette.colors) {
    CGFloat height = largeRect.size.height;
    CGFloat width = largeRect.size.width;
    
    if (color != self.selectedPalette.colors.lastObject) {
      if (height > width) {
        CGRectDivide(largeRect, &sliceRect, &leftoverRect, height / 2, CGRectMinYEdge);
      } else {
        CGRectDivide(largeRect, &sliceRect, &leftoverRect, width / 2, CGRectMinXEdge);
      }
    } else {
      sliceRect = largeRect;
    }
    
    UIView *v = [[UIView alloc] initWithFrame:sliceRect];
    v.backgroundColor = color;
    [self.view addSubview:v];
    largeRect = leftoverRect;
  }
  
}

@end
