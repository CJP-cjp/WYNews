//
//  HomeCollectionViewCell.m
//  网易新闻
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "NewsTableViewController.h"
@interface HomeCollectionViewCell()
{
NewsTableViewController *_newsVC;
}
//这样不行
//@property(weak,nonatomic)NewsTableViewController *newsVC;
@end
@implementation HomeCollectionViewCell
//cell完全加载完成之后，会调用的
-(void)awakeFromNib
{
    //NSLog(@"%s",__func__);
    UIStoryboard *newsStrryboard = [UIStoryboard storyboardWithName:@"News" bundle:nil];
   _newsVC = [newsStrryboard instantiateInitialViewController];
    
    _newsVC.tableView.frame = self.bounds;
    [self.contentView addSubview:_newsVC.tableView];
   _newsVC.tableView.backgroundColor =[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
   // NSLog(@"%@",_newsVC);
}
-(void)setURLString:(NSString *)URLString
{
    _URLString = URLString;
    //_newsVC.URLString = URLString;
}
@end
