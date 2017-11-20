//
//  LocalManager.m
//  hd_ios
//
//  Created by 朱信磊 on 2017/8/12.
//  Copyright © 2017年 com.bandou.app.hdIos. All rights reserved.
//

#import "LocalManager.h"
#import "AppDelegate.h"
static LocalManager *manager;

@interface LocalManager ()<AMapLocationManagerDelegate>

/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) NSMutableArray *mArr;
@property (nonatomic,strong) NSOperation *queryOperation;

@end

@implementation LocalManager

+ (LocalManager*)shareManager{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[LocalManager alloc]init];
        [manager initLocal];
    });
    return manager;
}


//初始化定位
- (void)initLocal{
    
    self.locationManager = [[AMapLocationManager alloc]init];
    self.locationManager.delegate = self;
    [self.locationManager setLocatingWithReGeocode:YES];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
    
    self.mArr = [[NSMutableArray alloc] init];
}
//开启定位
- (void)startLocation{
    [self.locationManager startUpdatingLocation];
}

/**
 *  @brief 连续定位回调函数.注意：如果实现了本方法，则定位信息不会通过amapLocationManager:didUpdateLocation:方法回调。
 *  @param manager 定位 AMapLocationManager 类。
 *  @param location 定位结果。
 *  @param reGeocode 逆地理信息。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    double longitude = location.coordinate.longitude;
    double latitude = location.coordinate.latitude;
    self.location = location;
    if (delegate.mode ==nil) {
        LocationMode *mode = [[LocationMode alloc]init];
        [mode setLongitude:longitude];
        [mode setLatitude:latitude];
        delegate.mode = mode;
    }else{
        [delegate.mode setLongitude:longitude];
        [delegate.mode setLatitude:latitude];
    }
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
}

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 AMapLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (status ==kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusDenied) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"当前定位不可用，请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [[[[UIApplication sharedApplication]keyWindow] rootViewController]presentViewController:alert animated:false completion:nil];
    }
}
@end
