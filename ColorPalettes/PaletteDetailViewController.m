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
    
    // sometimes start from top/left sometimes from bottom/right
    CGRectEdge verticalEdge = (arc4random_uniform(2) == 0) ? CGRectMinYEdge : CGRectMaxYEdge;
    CGRectEdge horizontalEdge = (arc4random_uniform(2) == 0) ? CGRectMinXEdge : CGRectMaxXEdge;
    
    CGRectEdge sliceFromEdge = (height > width) ? verticalEdge : horizontalEdge;
    CGFloat sliceAmount = (height > width) ? height/2 : width/2;
    
    CGRectDivide(largeRect, &sliceRect, &leftoverRect, sliceAmount, sliceFromEdge);
    
    // escape hatch for last color in list
    // can't divide here, or will have a white extra rect
    if (color == self.selectedPalette.colors.lastObject) {
      sliceRect = largeRect;
    }
    
    UIView *colorVeiw = [[UIView alloc] initWithFrame:sliceRect];
    colorVeiw.backgroundColor = color;
    [self.view addSubview:colorVeiw];
    largeRect = leftoverRect;
  }
}

@end
