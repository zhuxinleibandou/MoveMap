//
//  LocationSelectViewController.h
//  ZXLChooseMap
//
//  Created by 朱信磊 on 2017/11/20.
//  Copyright © 2017年 com.bandou.app.epay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>
@interface LocationSelectViewController : UIViewController
/** 当前的位置 */
@property (nonatomic,strong) LocationMode *location;

/** 选择位置的回调 */
@property (nonatomic,copy) void(^locationDidSelectCallBack)(LocationMode *model);

@end
