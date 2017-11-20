//
//  Model.m
//  ZXLChooseMap
//
//  Created by 朱信磊 on 2017/11/20.
//  Copyright © 2017年 com.bandou.app.epay. All rights reserved.
//

#import "Model.h"

@implementation Model
+ (id)safeWithDic:(NSDictionary *)dic
{
    return dic;
}
- (id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    //#ifdef DEBUG
    //    NSAssert1([dic isKindOfClass:[NSDictionary class]]||dic == nil, @"转模型发生错误, 传入的对象不是 NSDictionary 类, %@", dic);
    //#endif
    if (self) {
        
    }
    return self;
}
@end


@implementation LocationMode
+(id)safeWithDic:(NSDictionary *)dic{
    LocationMode *obj = [[LocationMode alloc]initWithDic:dic];
    return obj;
}

-(id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        
    }
    return self;
}


@end
