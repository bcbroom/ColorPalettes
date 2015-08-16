//
//  PaletteList.m
//  ColorPalettes
//
//  Created by Brian Broom on 8/16/15.
//  Copyright (c) 2015 Brian Broom. All rights reserved.
//

#import "PaletteList.h"

@implementation PaletteList

- (instancetype)init {
  self = [super init];
  if (self){
    [self refresh];
  }
  return self;
}

- (void)refresh {
  NSString *urlString = @"http://www.colourlovers.com/api/palettes/top?format=json";
  NSURL *url = [NSURL URLWithString:urlString];
  
  NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      NSLog(@"Error connecting to API: %@", [error localizedDescription]);
      return;
    }
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode != 200) {
      NSLog(@"Error reported from API: %ld", (long)httpResponse.statusCode);
      return;
    }
    
    NSError *jsonError = nil;
    NSArray *paletteArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
    
    if (jsonError) {
      NSLog(@"Error decoding API response: %@", [jsonError localizedDescription]);
      return;
    }
    
    // finally - good data here
    NSMutableArray *paletteObjectsToAdd = [NSMutableArray new];
    for (NSDictionary *paletteInfo in paletteArray) {
      [paletteObjectsToAdd addObject:[[Palette alloc] initWithJSONData:paletteInfo]];
    }
    _palettes = [paletteObjectsToAdd copy];
    
    dispatch_async(dispatch_get_main_queue(), ^{
      [[NSNotificationCenter defaultCenter] postNotificationName:@"PaletteListDidUpdate" object:nil];
    });
    
  }];
  [dataTask resume];
}

@end
