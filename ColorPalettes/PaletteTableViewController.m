//
//  PaletteTableViewController.m
//  ColorPalettes
//
//  Created by Brian Broom on 8/16/15.
//  Copyright (c) 2015 Brian Broom. All rights reserved.
//

#import "PaletteTableViewController.h"
#import "PaletteList.h"
#import "PaletteDetailViewController.h"

@interface PaletteTableViewController ()

@property (strong, nonatomic) PaletteList *paletteList;

@end

@implementation PaletteTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataRefreshed) name:@"PaletteListDidUpdate" object:nil];
  _paletteList = [PaletteList new];
}

- (void)dataRefreshed {
  [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.paletteList.palettes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PaletteCell" forIndexPath:indexPath];
  
  Palette *palette = self.paletteList.palettes[indexPath.row];
  cell.textLabel.text = palette.title;
  
  return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"ShowDetailSegue"]) {
    PaletteDetailViewController *toVC = segue.destinationViewController;
    toVC.selectedPalette = self.paletteList.palettes[ self.tableView.indexPathForSelectedRow.row ];
    toVC.title = toVC.selectedPalette.title;
  }
}

@end
