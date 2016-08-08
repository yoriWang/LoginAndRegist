//
//  ViewController.m
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/6/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    //定义一个登录按钮
    UIButton *loginBtn = [[UIButton alloc] init];
    loginBtn.layer.cornerRadius = 8.0f;
    loginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:22.0];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(showLoginViewController:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.backgroundColor = RGBColor(240, 101, 75);
    [self.view addSubview:loginBtn];
    [loginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ScreenH/2);
        make.centerX.equalTo(self.view.centerX);
        make.width.equalTo(ScreenW*2/3);
        make.height.equalTo(54);
    }];
    
    //定义一个注册按钮
    UIButton *registBtn = [[UIButton alloc] init];
    registBtn.layer.cornerRadius = 8.0f;
    registBtn.titleLabel.font = [UIFont boldSystemFontOfSize:22.0];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(showRegistViewController:) forControlEvents:UIControlEventTouchUpInside];
    registBtn.backgroundColor = RGBColor(7, 181, 180);
    [self.view addSubview:registBtn];
    [registBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.bottom).offset(38);
        make.left.equalTo(loginBtn.left);
        make.width.equalTo(loginBtn.width);
        make.height.equalTo(loginBtn.height);
    }];
    
    
}

#pragma mark - 跳转到登录界面
- (void)showLoginViewController:(UIButton *)sender {
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
    loginVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:loginVC animated:YES completion:nil];
}

#pragma mark - 跳转到注册界面
- (void)showRegistViewController:(UIButton *)sender {
    
    RegisterViewController *registVC = [[RegisterViewController alloc] init];
    registVC.modalPresentationStyle = UIModalPresentationFullScreen;
    registVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:registVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
