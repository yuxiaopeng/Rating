//
//  PlayerDetailsViewController.m
//  Ratings
//
//  Created by 于晓鹏 on 15/3/6.
//  Copyright (c) 2015年 于晓鹏. All rights reserved.
//

#import "PlayerDetailsViewController.h"
#import "Player.h"

@interface PlayerDetailsViewController ()

@end

@implementation PlayerDetailsViewController
{
    NSString *_game;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"init PlayerDetailsViewController");
        _game = @"Chess"; // Default Pick Game
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc PlayerDetailsViewController");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailLabel.text = _game;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.nameTextField becomeFirstResponder];
    }
}

- (IBAction)done:(id)sender
{
//    [self.delegate playerDetailsViewControllerDidSave:self];
    
    Player *player = [[Player alloc] init];
    player.name = self.nameTextField.text;
//    player.game = @"Chess";
    player.game = _game;
    player.rating = 1;
    
    [self.delegate playerDetailsViewControllerDidSave:self didAddPlayer:player];
}

- (IBAction)cancel:(id)sender
{
    [self.delegate playerDetailsViewControllerDidCancel:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickGame"]) {
        GamePickerViewController *gamePickerViewController = segue.destinationViewController;
        gamePickerViewController.delegate = self;
        gamePickerViewController.game = _game;
    }
}

- (void)gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)game
{
    _game = game;
    self.detailLabel.text = _game;
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
