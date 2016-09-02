//
//  HomeViewController.m
//  网易新闻
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelModel.h"
#import "ChannelLabel.h"
@interface HomeViewController ()
@property(weak,nonatomic)IBOutlet UIScrollView *scrollview;
@property(nonatomic,strong)NSArray *channelArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createChannel];
    // Do any additional setup after loading the view.
}
-(void)createChannel
{
    _channelArray = [ChannelModel channles];
    CGFloat labelW = 80;
    CGFloat labelH = self.scrollview.bounds.size.height;
    //    [channerlarray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //
    //        ChannelLabel *channelLab =[[ChannelLabel alloc]init];
    //    }];
    for (int i =0; i<_channelArray.count; i++) {
        ChannelLabel *channelLab =[[ChannelLabel alloc]init];
        
        [self.scrollview addSubview:channelLab];
        channelLab.frame =  CGRectMake(i*labelW, 0, labelW, labelH);
        self.scrollview.contentSize = CGSizeMake(labelW*_channelArray.count, 0);
        ChannelModel *model = _channelArray[i];
        channelLab.text = model.tname;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
