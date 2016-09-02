//
//  ChannelModel.m
//  网易新闻
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ChannelModel.h"

@implementation ChannelModel
+(instancetype)channelModelWithDict:(NSDictionary*)dict
{
    ChannelModel *model = [[ChannelModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
+(NSArray *)channles
{
    NSString *url = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    NSData* data = [NSData dataWithContentsOfFile:url];
    NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSArray *temp =dict[@"tList"];
    NSMutableArray *array = [NSMutableArray array];
    [temp enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       ChannelModel *model =  [ChannelModel channelModelWithDict:obj];
        [array addObject:model];
    }];
//    [temp sortedArrayUsingComparator:^NSComparisonResult(ChannelModel* obj1, ChannelModel*obj2) {
//        return [obj1.tid compare: obj2.tid ];
//    }];
   [array  sortUsingComparator:^NSComparisonResult(ChannelModel *obj1, ChannelModel *obj2) {
    
    return [obj1.tid compare:obj2.tid];
   }];
    
 
    return array.copy;
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@%@",self.tname,self.tid];
}
@end
