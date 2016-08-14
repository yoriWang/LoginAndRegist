//
//  MainViewController.m
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/9/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBarHidden = YES;
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 70, 30)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UILabel *successLabel = [[UILabel alloc] init];
    successLabel.text = @"登录成功啦...";
    successLabel.textAlignment = NSTextAlignmentCenter;
    successLabel.font = [UIFont systemFontOfSize:30.0];
    [self.view addSubview:successLabel];
    [successLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.centerY.equalTo(self.view.centerY);
        make.width.equalTo(ScreenW);
        make.height.equalTo(40);
    }];
    
    UIButton *logoutBtn = [[UIButton alloc] init];
    [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logoutBtn setTitle:@"注销当前用户" forState:UIControlStateNormal];
    logoutBtn.backgroundColor = RGBColor(220, 55, 62);
    [logoutBtn addTarget:self action:@selector(logoutAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutBtn];
    [logoutBtn makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.bottom).offset(-20);
        make.left.equalTo(20);
        make.right.equalTo(-20);
        make.height.equalTo(40);
    }];
    
}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 退出登录
- (void)logoutAction:(UIButton *)sender {
    //清除用户登录信息
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:YR_PHONE_NUM];
    [defaults removeObjectForKey:YR_PASSWORD];
    
    [(AppDelegate *)[UIApplication sharedApplication].delegate showWindowHome:@"logout"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
