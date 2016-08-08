//
//  LoginViewController.m
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/8/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
    [self.navigationBar setShadowImage:[UIImage new]];
    NSDictionary *attributeDic = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18.0]};
    [self.navigationBar setTitleTextAttributes:attributeDic];
//    self.title = @"登录";
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"登录";
    self.navigationItem.titleView = titleLabel;
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(showRegistViewController)];
    [rightItem setTitleTextAttributes:attributeDic forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}

- (void)showRegistViewController {
    
    RegisterViewController *registVC = [[RegisterViewController alloc] init];
    [self pushViewController:registVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
