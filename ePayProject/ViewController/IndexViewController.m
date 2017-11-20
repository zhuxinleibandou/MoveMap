//
//  IndexViewController.m
//  ePayProject
//
//  Created by 朱信磊 on 2017/11/14.
//  Copyright © 2017年 com.bandou.app.epay. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadView{
    [super loadView];
    self.navigationItem.titleView = [self titleView];
}


- (UIView *)titleView{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 20, kGetWidth(self.navigationItem.titleView.bounds), 44)];
    [v setBackgroundColor:[UIColor clearColor]];
    float kImgW = 30;
    float kImgH = 30;
    CGSize size = [[BDMethod bd_shareBDMethod]bd_getSizeWithText:@"大众" sizeWithFont:kFont(25) constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    float offset_x = (kGetWidth(v.bounds) - size.width * 2 - kImgW) /2;
    
    {
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(offset_x,0, size.width,kGetHeigh(v.bounds))];
        [lb setFont:kFont(25)];
        [lb setTextColor:[UIColor whiteColor]];
        [lb setTextAlignment:NSTextAlignmentCenter];
        [lb setText:@"大众"];
        [v addSubview:lb];
        offset_x+=kGetWidth(lb.bounds);
        offset_x+=kHeight(2);
    }
    {
        UIImageView *imgvc = [[UIImageView alloc]initWithFrame:CGRectMake(offset_x, (44 - kImgH) / 2, kImgW, kImgH)];
        [imgvc setImage:[[BDMethod bd_shareBDMethod]bd_safeImageFromColor:[UIColor redColor]]];
        [imgvc setContentMode:UIViewContentModeScaleAspectFill];
        [v addSubview:imgvc];
        offset_x+=kGetWidth(imgvc.bounds);
        offset_x+=kHeight(2);
    }
    {
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(offset_x,0, size.width,kGetHeigh(v.bounds))];
        [lb setFont:kFont(25)];
        [lb setTextColor:[UIColor whiteColor]];
        [lb setTextAlignment:NSTextAlignmentCenter];
        [lb setText:@"通付"];
        [v addSubview:lb];
    }
    
    return v;
}

@end
