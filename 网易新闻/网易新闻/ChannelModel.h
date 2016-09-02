//
//  ChannelModel.h
//  网易新闻
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject
@property(copy,nonatomic)NSString *tname;
@property(copy,nonatomic)NSString *tid;
+(NSArray*)channles;
@end
