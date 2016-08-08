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
/**
 *  手机号码输入框
 */
@property (nonatomic, strong) UITextField *phoneNumberTextField;
/**
 *  密码输入框
 */
@property (nonatomic, strong) UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置背景图
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    //显示导航栏
    self.navigationController.navigationBar.hidden = NO;
    //设置导航栏为透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    //设置导航栏Item属性
    NSDictionary *attributeDic = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18.0]};
    
    [self.navigationController.navigationBar setTitleTextAttributes:attributeDic];
    self.title = @"登录";
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
//    titleLabel.text = @"登录";
//    self.navigationItem.titleView = titleLabel;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(showRegistViewController)];
    [rightItem setTitleTextAttributes:attributeDic forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    //设置返回按钮图片显示为原来的白色，默认显示系统天蓝色
    [backItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIView *phoneView = [[UIView alloc] init];
    phoneView.backgroundColor = RGBColor(240, 92, 65);
    [self.view addSubview:phoneView];
    [phoneView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(79);
        make.left.equalTo(10);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];
    
    UIImageView *phoneImageView = [[UIImageView alloc] init];
    phoneImageView.image = [UIImage imageNamed:@"phone.png"];
    [phoneView addSubview:phoneImageView];
    [phoneImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(15);
        make.left.equalTo(15);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    
    UIView *phoneInputView = [[UIView alloc] init];
    phoneInputView.backgroundColor = RGBColor(133, 133, 133);
    [self.view addSubview:phoneInputView];
    [phoneInputView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneView.top);
        make.left.equalTo(phoneView.right);
        make.width.equalTo(ScreenW-80);
        make.height.equalTo(phoneView.height);
    }];
    
    _phoneNumberTextField = [[UITextField alloc] init];
    _phoneNumberTextField.placeholder = @"请输入手机号";
    _phoneNumberTextField.backgroundColor = RGBColor(133, 133, 133);
    [phoneInputView addSubview:_phoneNumberTextField];
    [_phoneNumberTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneImageView.top);
        make.left.equalTo(8);
        make.right.equalTo(-8);
        make.height.equalTo(30);
    }];
    
    UIView *pwdView = [[UIView alloc] init];
    pwdView.backgroundColor = RGBColor(240, 92, 65);
    [self.view addSubview:pwdView];
    [pwdView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneView.bottom).offset(15);
        make.left.equalTo(phoneView.left);
        make.width.equalTo(phoneView.width);
        make.height.equalTo(phoneView.height);
    }];
    
    UIImageView *pwdImageView = [[UIImageView alloc] init];
    pwdImageView.image = [UIImage imageNamed:@"mima.png"];
    [pwdView addSubview:pwdImageView];
    [pwdImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(pwdView.centerX);
        make.centerY.equalTo(pwdView.centerY);
        make.width.equalTo(phoneImageView.width);
        make.height.equalTo(phoneImageView.height);
    }];
    
    UIView *pwdInputView = [[UIView alloc] init];
    pwdInputView.backgroundColor = RGBColor(133, 133, 133);
    [self.view addSubview:pwdInputView];
    [pwdInputView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdView.top);
        make.left.equalTo(pwdView.right);
        make.width.equalTo(phoneInputView.width);
        make.height.equalTo(phoneInputView.height);
    }];
    
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.backgroundColor = RGBColor(133, 133, 133);
    [pwdInputView addSubview:_passwordTextField];
    [_passwordTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdImageView.top);
        make.left.equalTo(_phoneNumberTextField.left);
        make.width.equalTo(_phoneNumberTextField.width);
        make.height.equalTo(30);
    }];
    
}

- (void)showRegistViewController {
    
    RegisterViewController *registVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registVC animated:YES];
//    registVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentViewController:registVC animated:YES completion:nil];
    
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
