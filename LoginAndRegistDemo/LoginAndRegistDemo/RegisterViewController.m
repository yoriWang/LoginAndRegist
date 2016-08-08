//
//  RegisterViewController.m
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/8/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    self.navigationController.navigationBar.hidden = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    NSDictionary *attributeDic = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18.0]};
    
    [self.navigationController.navigationBar setTitleTextAttributes:attributeDic];
    self.title = @"注册";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    //设置返回按钮图片显示为原来的白色，默认显示系统天蓝色
    [backItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = backItem;
    
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
