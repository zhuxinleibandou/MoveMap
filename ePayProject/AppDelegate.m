//
//  AppDelegate.m
//  ePayProject
//
//  Created by 朱信磊 on 2017/11/14.
//  Copyright © 2017年 com.bandou.app.epay. All rights reserved.
//

#import "AppDelegate.h"
#import "LocalManager.h"
#import "LocationSelectViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.window makeKeyAndVisible];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [nav.navigationBar setTintColor:[UIColor blackColor]];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    [nav.navigationBar setTranslucent:false];  //将Translucent穿透/透明效果取消
    nav.interactivePopGestureRecognizer.enabled = NO; //去掉右滑 返回效果
    [self.window setRootViewController:nav];
    [application setApplicationIconBadgeNumber:0];
    [self initMap];
    return YES;
}

//初始化高德地图定位
- (void)initMap{
    [AMapServices sharedServices].apiKey = @"cec0568539fb6d35985adfc0d46d7c3e";
    [[LocalManager shareManager] startLocation];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
