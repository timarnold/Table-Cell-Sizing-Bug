//
//  TableViewController.m
//  Table Cell Sizing Bug
//
//  Created by Tim Arnold on 12/4/14.
//  Copyright (c) 2014 Friends of The Web. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row != 0) {
        [tableView beginUpdates];
        [tableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        [tableView endUpdates];
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 88.f;
//}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                          forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithHue:1 - (indexPath.row / 200.)
                                      saturation:1 - (indexPath.row / 200.)
                                      brightness:1 - (indexPath.row / 200.)
                                           alpha:1];
    return cell;
}


@end
