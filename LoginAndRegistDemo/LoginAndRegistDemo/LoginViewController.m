//
//  LoginViewController.m
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/8/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"

@interface LoginViewController ()<UITextFieldDelegate> {
    NSString *_phoneNum;//手机号
    NSString *_password;//密码
}
/**
 *  手机号码输入框
 */
@property (nonatomic, strong) UITextField *phoneNumberTextField;
/**
 *  密码输入框
 */
@property (nonatomic, strong) UITextField *passwordTextField;
/**
 *  记住密码按钮
 */
@property (nonatomic, strong) UIButton *checkedBtn;

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
    
    //定义一个view，用于放置图片
    UIView *phoneView = [[UIView alloc] init];
    phoneView.backgroundColor = RGBColor(240, 92, 65);
    [self.view addSubview:phoneView];
    [phoneView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(79);
        make.left.equalTo(10);
        make.width.equalTo(60);
        make.height.equalTo(60);
    }];
    
    //定义imageview，用于显示图片
    UIImageView *phoneImageView = [[UIImageView alloc] init];
    phoneImageView.image = [UIImage imageNamed:@"phone.png"];
    [phoneView addSubview:phoneImageView];
    [phoneImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(15);
        make.left.equalTo(15);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    
    //放置电话号码输入的view
    UIView *phoneInputView = [[UIView alloc] init];
    phoneInputView.backgroundColor = RGBColor(133, 133, 133);
    [self.view addSubview:phoneInputView];
    [phoneInputView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneView.top);
        make.left.equalTo(phoneView.right);
        make.width.equalTo(ScreenW-80);
        make.height.equalTo(phoneView.height);
    }];
    
    //号码输入框
    _phoneNumberTextField = [[UITextField alloc] init];
    _phoneNumberTextField.placeholder = @"请输入手机号";
    _phoneNumberTextField.backgroundColor = RGBColor(133, 133, 133);
    _phoneNumberTextField.delegate = self;
    [phoneInputView addSubview:_phoneNumberTextField];
    [_phoneNumberTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneImageView.top);
        make.left.equalTo(5);
        make.right.equalTo(-5);
        make.height.equalTo(30);
    }];
    
    //放置密码图片view
    UIView *pwdView = [[UIView alloc] init];
    pwdView.backgroundColor = RGBColor(240, 92, 65);
    [self.view addSubview:pwdView];
    [pwdView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneView.bottom).offset(15);
        make.left.equalTo(phoneView.left);
        make.width.equalTo(phoneView.width);
        make.height.equalTo(phoneView.height);
    }];
    
    //显示密码图片
    UIImageView *pwdImageView = [[UIImageView alloc] init];
    pwdImageView.image = [UIImage imageNamed:@"mima.png"];
    [pwdView addSubview:pwdImageView];
    [pwdImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(pwdView.centerX);
        make.centerY.equalTo(pwdView.centerY);
        make.width.equalTo(phoneImageView.width);
        make.height.equalTo(phoneImageView.height);
    }];
    
    //放置密码输入框view
    UIView *pwdInputView = [[UIView alloc] init];
    pwdInputView.backgroundColor = RGBColor(133, 133, 133);
    [self.view addSubview:pwdInputView];
    [pwdInputView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdView.top);
        make.left.equalTo(pwdView.right);
        make.width.equalTo(phoneInputView.width);
        make.height.equalTo(phoneInputView.height);
    }];
    
    //密码输入框
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.backgroundColor = RGBColor(133, 133, 133);
    _passwordTextField.delegate = self;
    [pwdInputView addSubview:_passwordTextField];
    [_passwordTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdImageView.top);
        make.left.equalTo(_phoneNumberTextField.left);
        make.width.equalTo(_phoneNumberTextField.width);
        make.height.equalTo(30);
    }];
    
    //记住密码按钮
    _checkedBtn = [[UIButton alloc] init];
    [_checkedBtn setImage:[UIImage imageNamed:@"unChecked.png"] forState:UIControlStateNormal];
    [_checkedBtn setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
    [_checkedBtn addTarget:self action:@selector(rememberPassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_checkedBtn];
    [_checkedBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdView.bottom).offset(38);
        make.left.equalTo(pwdView.left);
        make.width.equalTo(17);
        make.height.equalTo(17);
    }];
    
    UILabel *autoLoginLabel = [[UILabel alloc] init];
    autoLoginLabel.text = @"自动登录";
    autoLoginLabel.font = [UIFont boldSystemFontOfSize:17.0];
    autoLoginLabel.textColor = RGBColor(240, 92, 65);
    [self.view addSubview:autoLoginLabel];
    [autoLoginLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_checkedBtn.top).offset(-2);
        make.left.equalTo(_checkedBtn.right);
        make.width.lessThanOrEqualTo(ScreenW/3);
        make.height.equalTo(20);
    }];
    
    //登录按钮
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:22.0];
    loginBtn.layer.cornerRadius = 8.0f;
    loginBtn.layer.borderWidth = 2;
    loginBtn.layer.borderColor = RGBColor(240, 92, 65).CGColor;
    [loginBtn setTitleColor:RGBColor(240, 92, 65) forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginToMainViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(autoLoginLabel.bottom).offset(50);
        make.left.equalTo(15);
        make.width.equalTo(ScreenW-30);
        make.height.equalTo(60);
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _phoneNumberTextField.text = @"";
    _passwordTextField.text = @"";
    _checkedBtn.selected = NO;
}

#pragma mark - 登录到主界面
- (void)loginToMainViewController:(UIButton *)sender {
    
    if (![self vertifyInput]) return;
    
    if (SYS_VERSION < 8.0) {
        //提示注册成功
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        
        HUD.labelText = @"正在登陆...";
        [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    } else {
        
        if (_checkedBtn.selected) {
            NSUserDefaults *defaults = [ NSUserDefaults standardUserDefaults];
            [defaults setObject:_phoneNum forKey:YR_PHONE_NUM];
            [defaults setObject:_password forKey:YR_PASSWORD];
            [defaults synchronize];
        }
        
        //用户信息验证成功，跳转至主界面
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.label.text = @"正在登陆...";
#warning if SystemVersion < 8.0, there will be crash
        //真机运行到这就挂了---待解决
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            sleep(2);
            dispatch_async(dispatch_get_main_queue(), ^{
                [hud hideAnimated:YES];
                MainViewController *mainVC = [[MainViewController alloc] init];
                mainVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//                [self.navigationController pushViewController:mainVC animated:YES];
                [self presentViewController:mainVC animated:YES completion:nil];
            });
        });
    }
    
}

#pragma mark - 验证用户输入
-(BOOL)vertifyInput {
    
    _phoneNum = self.phoneNumberTextField.text;
    _password = self.passwordTextField.text;
    
    if ([NSString isEmptyOrNullWithString:_phoneNum]) {
        [MBProgressHUD showHUD:self.view meaasge:@"请输入账号"];
        return NO;
    }
    
    if ([NSString isEmptyOrNullWithString:_password]) {
        [MBProgressHUD showHUD:self.view meaasge:@"请输入密码"];
        return NO;
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *value = [defaults objectForKey:_phoneNum];//取出密码
    if (!value) {
        [MBProgressHUD showHUD:self.view meaasge:@"该用户不存在"];
        return NO;
    } else {
        if (![value isEqualToString:_password]) {
            [MBProgressHUD showHUD:self.view meaasge:@"密码错误"];
            return NO;
        }
    }
    
    return YES;
}

#pragma mark - 跳转到注册界面
- (void)showRegistViewController {
    
    RegisterViewController *registVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registVC animated:YES];
//    registVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentViewController:registVC animated:YES completion:nil];
    
}

#pragma mark - 记住密码选项
- (void)rememberPassword:(UIButton *)sender {
    sender.selected = !sender.selected;
}

#pragma mark -textField代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

//子线程中
- (void)myTask {
    // Do something usefull in here instead of sleeping ...
    sleep(1);
    // 返回主线程执行
    [self  performSelectorOnMainThread:@selector(goToMainView) withObject:nil waitUntilDone:FALSE];
}

-(void) goToMainView {
    //跳转到主界面
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self.navigationController pushViewController:mainVC animated:YES];
    [self presentViewController:mainVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
