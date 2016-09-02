
//
//  ChannelLabel.m
//  网易新闻
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.textAlignment =  NSTextAlignmentCenter;
        
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    }
    return self;
}
@end
