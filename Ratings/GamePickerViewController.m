//
//  GamePickerViewController.m
//  Ratings
//
//  Created by 于晓鹏 on 15/3/6.
//  Copyright (c) 2015年 于晓鹏. All rights reserved.
//

#import "GamePickerViewController.h"

@interface GamePickerViewController ()

@end

@implementation GamePickerViewController
{
    NSArray *_games;
    NSUInteger _selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _games = @[@"Angry Birds",
               @"Chess",
               @"Russian Roulette",
               @"Spin the Bottle",
               @"Texas Hold'em Pocker",
               @"Tic-Tac-Toe"];
    
    _selectedIndex = [_games indexOfObject:self.game];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_games count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"];
    cell.textLabel.text = _games[indexPath.row];
    if (indexPath.row == _selectedIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_selectedIndex != NSNotFound) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    _selectedIndex = indexPath.row;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    NSString *theGame = _games[indexPath.row];
    [self.delegate gamePickerViewController:self didSelectGame:theGame];
}

@end
