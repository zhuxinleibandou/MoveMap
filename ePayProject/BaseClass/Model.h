//
//  Model.h
//  ZXLChooseMap
//
//  Created by 朱信磊 on 2017/11/20.
//  Copyright © 2017年 com.bandou.app.epay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
+ (id)safeWithDic:(NSDictionary *)dic;

- (id)initWithDic:(NSDictionary *)dic;
@end


#pragma mark - 位置对象
@interface LocationMode : Model
/**
 地址
 */
@property (strong, nonatomic) NSString *address;

/**
 经度
 */
@property (assign, nonatomic) double  Longitude;

/**
 纬度
 */
@property (assign, nonatomic) double Latitude;

/**
 城市码
 */
@property (strong, nonatomic) NSString *cityCode;

/**
 区域码
 */
@property (strong, nonatomic) NSString *disCode;

/** adcode */
@property (nonatomic,copy) NSString *adcode;

/** 城市名 */
@property (nonatomic,copy) NSString *cityName;

@end
