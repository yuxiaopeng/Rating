//
//  Player.h
//  Ratings
//
//  Created by 于晓鹏 on 15/3/5.
//  Copyright (c) 2015年 于晓鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;

@end
