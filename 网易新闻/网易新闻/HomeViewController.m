//
//  HomeViewController.m
//  网易新闻
//
//  Created by mac on 16/9/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelModel.h"
#import "ChannelLabel.h"
#import "HomeCollectionViewCell.h"
@interface HomeViewController ()<UICollectionViewDataSource>
@property(nonatomic,strong)NSArray *channelArray;
@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowOut;

@end

@implementation HomeViewController
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   // self.newsCollectionView.delegate =
    self.flowOut.itemSize = self.newsCollectionView.bounds.size;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollview.showsHorizontalScrollIndicator = NO;
    [self createChannel];
}

-(void)createChannel
{
    _channelArray = [ChannelModel channles];
    CGFloat labelW = 80;
    CGFloat labelH = self.scrollview.bounds.size.height;
       for (int i =0; i<_channelArray.count; i++) {
        ChannelLabel *channelLab =[[ChannelLabel alloc]init];

        [self.scrollview addSubview:channelLab];
        channelLab.frame =  CGRectMake(i*labelW, 0, labelW, labelH);
        self.scrollview.contentSize = CGSizeMake(labelW*_channelArray.count, 0);
        ChannelModel *model = _channelArray[i];
        channelLab.text = model.tname;
           UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
           [channelLab addGestureRecognizer:tap];
           channelLab.userInteractionEnabled = YES;
           channelLab.tag = i;

    }
}

#pragma mark - k 实现实收监听方法
-(void)tapAction:(UITapGestureRecognizer*)tap
{
    ChannelLabel *selectedLable = (ChannelLabel*)tap.view;
    CGFloat minOffSetX = 0;
    CGFloat maxOffSetX = self.scrollview.contentSize.width - self.view.bounds.size.width;
    CGFloat offSetX ;
    offSetX = selectedLable .center.x - self.view.bounds.size.width*0.5;
    if (offSetX < minOffSetX) {
        offSetX = minOffSetX;
    }else if(offSetX > maxOffSetX)
    {
        offSetX = maxOffSetX;
        
    }else
    {
        //[self.scrollview setContentOffset:CGPointMake(offSetX, 0)];
        [self.scrollview setContentOffset:CGPointMake(offSetX, 0) animated:YES];
    }
    //让新闻视图滚动到指定的频道下面
   // NSIndexPath *indexPath = [NSIndexPath indexPathForItem:selectedLable .tag inSection:0];
     NSIndexPath *indeP =[NSIndexPath indexPathForRow:selectedLable.tag inSection:0];
    [self.newsCollectionView scrollToItemAtIndexPath:indeP atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
    
}
#pragma mark -k 数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _channelArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    //取出频道标签对应的模型
    ChannelModel *model = _channelArray[indexPath.item];
    NSString *URLString = [NSString stringWithFormat:@"article/headline/%@/0-20.html",model.tid];
    cell.URLString = URLString;
    //    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0 alpha:1];
    
    return cell;
}
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
//     cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0 alpha:1];
//    return cell;
//}

@end
