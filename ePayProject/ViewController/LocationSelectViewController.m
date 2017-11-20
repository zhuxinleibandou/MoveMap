//
//  LocationSelectViewController.m
//  ZXLChooseMap
//
//  Created by 朱信磊 on 2017/11/20.
//  Copyright © 2017年 com.bandou.app.epay. All rights reserved.
//

#import "LocationSelectViewController.h"
#import "AppDelegate.h"
@interface LocationSelectViewController ()<MAMapViewDelegate,AMapSearchDelegate>

/** 地图 */
@property (nonatomic,weak) MAMapView *mapView;

/** 搜索的 */
@property (nonatomic,strong) AMapSearchAPI *search;

/** 当前选择的位置 */
@property (nonatomic,strong) LocationMode *model;


@end

@implementation LocationSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    float lat = ((AppDelegate *)[UIApplication sharedApplication].delegate).mode.Latitude;
    float log = ((AppDelegate *)[UIApplication sharedApplication].delegate).mode.Longitude;
    
    if (self.location) {
        if (self.location.Longitude>0 && self.location.Latitude > 0) {
            [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(self.location.Latitude, self.location.Longitude) animated:true];
        }
    }else{
        if (lat>0 && log>0) {
            [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(lat,log)];
        }
    }
    AMapReGeocodeSearchRequest *req = [[AMapReGeocodeSearchRequest alloc] init];
    req.location = [AMapGeoPoint locationWithLatitude:lat longitude:log];
    req.requireExtension = true;
    [self.search AMapReGoecodeSearch:req];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView{
    [super loadView];
    MAMapView *mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    mapView.delegate = self;
    mapView.zoomLevel = 17;
    mapView.rotateEnabled = false;
    mapView.rotateCameraEnabled = false;
    mapView.showsCompass = false;
    [self.view addSubview:mapView];
    _mapView = mapView;
    
    MAPointAnnotation *anno = [[MAPointAnnotation alloc] init];
    anno.lockedToScreen = true;
    anno.lockedScreenPoint = self.view.center;
    [_mapView addAnnotation:anno];
    anno.subtitle = @"未获取到位置";
    anno.title = @"位置";
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
}


- (void)viewDidAppear:(BOOL)animated{

}



- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        MAPinAnnotationView *pointView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"point"];
        pointView.pinColor = MAPinAnnotationColorPurple;
        pointView.enabled = false;
        pointView.selected = true;
        pointView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        return pointView;
    }
    return nil;
}

- (void)mapView:(MAMapView *)mapView didDeselectAnnotationView:(MAAnnotationView *)view{
    [mapView selectAnnotation:view.annotation animated:false];
}


- (void)mapView:(MAMapView *)mapView mapDidMoveByUser:(BOOL)wasUserAction{
    MAPointAnnotation *anno = [mapView annotations].firstObject;
    [mapView selectAnnotation:anno animated:true];
    AMapReGeocodeSearchRequest *req = [[AMapReGeocodeSearchRequest alloc] init];
    req.location = [AMapGeoPoint locationWithLatitude:anno.coordinate.latitude longitude:anno.coordinate.longitude];
    req.requireExtension = true;
    [self.search AMapReGoecodeSearch:req];
}

/* 逆地理编码回调. */
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    MAPointAnnotation *anno = [_mapView annotations].firstObject;
    if (response.regeocode != nil)
    {
        self.model.Longitude = anno.coordinate.longitude;
        self.model.Latitude = anno.coordinate.latitude;
        self.model.address = [NSString stringWithFormat:@"%@%@%@%@%@",response.regeocode.addressComponent.district,response.regeocode.addressComponent.township,response.regeocode.addressComponent.building,response.regeocode.addressComponent.streetNumber.street,response.regeocode.addressComponent.streetNumber.number];
        self.model.adcode = response.regeocode.addressComponent.adcode;
        
        NSString *dealCode = @"";
        if ([self.model.adcode length] >= 6)
        {
            dealCode = [self.model.adcode substringToIndex:self.model.adcode.length - 2];
        }
        NSString *cityCode = [NSString stringWithFormat:@"%@00",dealCode];
        self.model.cityCode = cityCode;
        
        if (response.regeocode.formattedAddress) {
            anno.subtitle = [NSString stringWithFormat:@"%@%@%@%@%@",response.regeocode.addressComponent.district,response.regeocode.addressComponent.township,response.regeocode.addressComponent.building,response.regeocode.addressComponent.streetNumber.street,response.regeocode.addressComponent.streetNumber.number];
        }else{
            anno.subtitle = @"未获取到位置";
            _model.address = @"未获取到地理位置";
            _model.Latitude = 0;
            _model.Longitude = 0;
            _model.disCode = @"0";
            _model.adcode = @"0";
        }
    }else{
        anno.subtitle = @"未获取到位置";
        _model.address = @"未获取到地理位置";
        _model.Latitude = 0;
        _model.Longitude = 0;
        _model.disCode = @"0";
        _model.adcode = @"0";
    }
}

@end
