//
//  PlayerCell.h
//  Ratings
//
//  Created by 于晓鹏 on 15/3/5.
//  Copyright (c) 2015年 于晓鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *gameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ratingImageView;

@end
