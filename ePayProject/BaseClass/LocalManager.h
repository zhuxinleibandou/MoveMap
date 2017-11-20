//
//  LocalManager.h
//  hd_ios
//
//  Created by 朱信磊 on 2017/8/12.
//  Copyright © 2017年 com.bandou.app.hdIos. All rights reserved.
//  定位管理

#import <Foundation/Foundation.h>
#import "Model.h"
#import <AMapLocationKit/AMapLocationKit.h>

@interface LocalManager : NSObject

+ (LocalManager *)shareManager;

@property (strong, nonatomic) AMapLocationManager *locationManager;

/** 定位的位置 */
@property (nonatomic,strong) CLLocation *location;

//开启定位
- (void)startLocation;

@property (strong, nonatomic) NSMutableArray *strockArr;

#pragma mark - 获取行程列表
- (void)requestStrokeListAction;

@end
