//
//  PlayersViewController.h
//  Ratings
//
//  Created by 于晓鹏 on 15/3/5.
//  Copyright (c) 2015年 于晓鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "PlayerCell.h"
#import "PlayerDetailsViewController.h"

@interface PlayersViewController : UITableViewController <PlayerDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;

@end
