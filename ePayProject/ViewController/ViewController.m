//
//  ViewController.m
//  ZXLChooseMap
//
//  Created by 朱信磊 on 2017/11/20.
//  Copyright © 2017年 com.bandou.app.epay. All rights reserved.
//

#import "ViewController.h"
#import "LocationSelectViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(50, 80, 170, 50)];
    [bt setTitle:@"进入地图拖动" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bt addTarget:self
           action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}


- (void)Click{
    LocationSelectViewController *vc = [[LocationSelectViewController alloc]init];
    vc.location = ((AppDelegate *)[UIApplication sharedApplication].delegate).mode;
    [self.navigationController pushViewController:vc animated:YES];
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
