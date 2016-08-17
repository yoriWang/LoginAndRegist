//
//  RegisterViewController.m
//  LoginAndRegistDemo
//
//  Created by FicentDev on 8/8/16.
//  Copyright © 2016 yori. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate> {
    NSString *_randomStr; //随机数
    
    NSString *_phoneNum;  //手机号
    NSString *_verificationCode;//验证码
    NSString *_password;  //密码
}
/**
 *  注册手机号
 */
@property (nonatomic, strong) UITextField *phoneTextField;
/**
 *  注册密码
 */
@property (nonatomic, strong) UITextField *pwdTextField;
/**
 *  验证码
 */
@property (nonatomic, strong) UITextField *vCodeTextField;
/**
 *  是否同意用户协议
 */
@property (nonatomic, strong) UIButton *checkedBtn;
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
        make.centerX.equalTo(phoneView.centerX);
        make.centerY.equalTo(phoneView.centerY);
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
    
    _phoneTextField = [[UITextField alloc] init];
    _phoneTextField.placeholder = @"请输入手机号";
    _phoneTextField.delegate = self;
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTextField.backgroundColor = RGBColor(133, 133, 133);
    [phoneInputView addSubview:_phoneTextField];
    [_phoneTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneImageView.top);
        make.left.equalTo(5);
        make.right.equalTo(phoneInputView.right).offset(-100);;
        make.height.equalTo(30);
    }];
    
    UIButton *getVCodeBtn = [[UIButton alloc] init];
    getVCodeBtn.layer.cornerRadius = 5.0f;
    getVCodeBtn.backgroundColor = RGBColor(139, 139, 139);
    [getVCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    getVCodeBtn.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [getVCodeBtn setTitleColor:RGBColor(231, 231, 231) forState:UIControlStateNormal];
    [getVCodeBtn addTarget:self action:@selector(getVerificationCode:) forControlEvents:UIControlEventTouchUpInside];
    [phoneInputView addSubview:getVCodeBtn];
    [getVCodeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneTextField.top);
        make.left.equalTo(_phoneTextField.right);
        make.right.equalTo(phoneInputView.right).offset(-3);
        make.height.equalTo(_phoneTextField.height);
    }];
    
    UIView *verificateView = [[UIView alloc] init];
    verificateView.backgroundColor = RGBColor(240, 92, 65);
    [self.view addSubview:verificateView];
    [verificateView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneView.bottom).offset(10);
        make.left.equalTo(phoneView.left);
        make.width.equalTo(phoneView.width);
        make.height.equalTo(phoneView.height);
    }];
    
    UIImageView *vcodeImageView = [[UIImageView alloc] init];
    vcodeImageView.image = [UIImage imageNamed:@"validation.png"];
    [verificateView addSubview:vcodeImageView];
    [vcodeImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(verificateView.centerX);
        make.centerY.equalTo(verificateView.centerY);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    
    UIView *verificateInputView = [[UIView alloc] init];
    verificateInputView.backgroundColor = RGBColor(133, 133, 133);
    [self.view addSubview:verificateInputView];
    [verificateInputView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(verificateView.top);
        make.left.equalTo(verificateView.right);
        make.width.equalTo(phoneInputView.width);
        make.height.equalTo(verificateView.height);
    }];
    
    _vCodeTextField = [[UITextField alloc] init];
    _vCodeTextField.placeholder = @"请输入验证码";
    _vCodeTextField.delegate = self;
    _vCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    _vCodeTextField.backgroundColor = RGBColor(133, 133, 133);
    [verificateInputView addSubview:_vCodeTextField];
    [_vCodeTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vcodeImageView.top);
        make.left.equalTo(_phoneTextField.left);
        make.right.equalTo(verificateInputView.right).offset(-5);
        make.height.equalTo(vcodeImageView.height);
    }];
    
    UIView *pwdView = [[UIView alloc] init];
    pwdView.backgroundColor = RGBColor(240, 92, 65);
    [self.view addSubview:pwdView];
    [pwdView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(verificateView.bottom).offset(10);
        make.left.equalTo(verificateView.left);
        make.width.equalTo(verificateView.width);
        make.height.equalTo(verificateView.height);
    }];
    
    UIImageView *pwdImageView = [[UIImageView alloc] init];
    pwdImageView.image = [UIImage imageNamed:@"mima.png"];
    [pwdView addSubview:pwdImageView];
    [pwdImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(pwdView.centerX);
        make.centerY.equalTo(pwdView.centerY);
        make.width.equalTo(vcodeImageView.width);
        make.height.equalTo(vcodeImageView.height);
    }];
    
    UIView *pwdInputView = [[UIView alloc] init];
    pwdInputView.backgroundColor = RGBColor(133, 133, 133);
    [self.view addSubview:pwdInputView];
    [pwdInputView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdView.top);
        make.left.equalTo(pwdView.right);
        make.width.equalTo(verificateInputView.width);
        make.height.equalTo(pwdView.height);
    }];
    
    _pwdTextField = [[UITextField alloc] init];
    _pwdTextField.placeholder = @"请输入密码";
    _pwdTextField.secureTextEntry = YES;
    _pwdTextField.delegate = self;
    _pwdTextField.backgroundColor = RGBColor(133, 133, 133);
    [pwdInputView addSubview:_pwdTextField];
    [_pwdTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdImageView.top);
        make.left.equalTo(_vCodeTextField.left);
        make.width.equalTo(_vCodeTextField.width);
        make.height.equalTo(pwdImageView.height);
    }];
    
    _checkedBtn = [[UIButton alloc] init];
    [_checkedBtn setImage:[UIImage imageNamed:@"unChecked.png"] forState:UIControlStateNormal];
    [_checkedBtn setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
    [_checkedBtn addTarget:self action:@selector(agreeWithUserProtocol:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_checkedBtn];
    [_checkedBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdView.bottom).offset(15);
        make.left.equalTo(pwdView.left);
        make.width.equalTo(17);
        make.height.equalTo(17);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"我已阅读并接受";
    label.font = [UIFont boldSystemFontOfSize:17.0];
    label.textColor = RGBColor(125, 125, 125);
    [self.view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_checkedBtn.top).offset(-2);
        make.left.equalTo(_checkedBtn.right);
        make.width.lessThanOrEqualTo(ScreenW*2/3);
        make.height.equalTo(20);
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"用户协议" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    [button setTitleColor:RGBColor(215, 84, 60) forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.top);
        make.left.equalTo(label.right);
        make.width.lessThanOrEqualTo(ScreenW/3);
        make.height.equalTo(20);
    }];
    
    UIButton *nextBtn = [[UIButton alloc] init];
    [nextBtn setTitle:@"下 一  步" forState:UIControlStateNormal];
    nextBtn.titleLabel.font = [UIFont boldSystemFontOfSize:22.0];
    nextBtn.layer.cornerRadius = 8.0f;
    nextBtn.layer.borderWidth = 2;
    nextBtn.layer.borderColor = RGBColor(240, 92, 65).CGColor;
    [nextBtn setTitleColor:RGBColor(240, 92, 65) forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(checkedCurrentDataAndSaveData:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    [nextBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(50);
        make.left.equalTo(15);
        make.width.equalTo(ScreenW-30);
        make.height.equalTo(60);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _phoneTextField.text = @"";
    _pwdTextField.text = @"";
    _vCodeTextField.text = @"";
    _checkedBtn.selected = NO;
}

#pragma mark - 获取验证码
- (void)getVerificationCode:(UIButton *)sender {
    int random = (arc4random() % 899999) + 100000;//产生6位随机数
    _randomStr = [NSString stringWithFormat:@"%i", random];
    [MBProgressHUD showHUD:self.view meaasge:_randomStr];
}

#pragma mark - UITextField代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}

#pragma mark - 同意用户协议
- (void)agreeWithUserProtocol:(UIButton *)sender {
    sender.selected = !sender.selected;
}

#pragma mark - 注册并检查用户注册数据的完整性
- (void)checkedCurrentDataAndSaveData:(UIButton *)sender {
    if (![self vertifyInput]) return;
    //注册成功，将数据写入沙盒
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *value = [defaults objectForKey:_phoneNum];
    if (value) {
        [MBProgressHUD showHUD:self.view meaasge:@"该用户已存在"];
        return;
    }
    
    [defaults setObject:_password forKey:_phoneNum];//手机绑定密码，使手机号唯一
    [defaults synchronize];
    
    if (SYS_VERSION < 8.0) {
        //提示注册成功
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        
        HUD.labelText = @"注册成功，请稍等";
        [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    } else {

#warning if SystemVersion < 8.0, there will be crash
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.label.text = @"注册成功，请稍等";
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            sleep(1);
            dispatch_async(dispatch_get_main_queue(), ^{
                [hud hideAnimated:YES];
                [self backAction];
            });
        });
    }
    
    
}

#pragma mark - 返回
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma  mark - 验证用户输入
-(BOOL)vertifyInput {
    
    _phoneNum = self.phoneTextField.text;
    _verificationCode = self.vCodeTextField.text;
    _password = self.pwdTextField.text;
    
    if ([NSString isEmptyOrNullWithString:_phoneNum]) {
        [MBProgressHUD showHUD:self.view meaasge:@"请输入手机号"];
        return NO;
    }
    
    if (![self validateMobile:_phoneNum]) {
        [MBProgressHUD showHUD:self.view meaasge:@"请输入正确的手机号"];
        return NO;
    }
    
    if ([NSString isEmptyOrNullWithString:_verificationCode]) {
        [MBProgressHUD showHUD:self.view meaasge:@"请输入验证码"];
        return NO;
    }
    
    if (![_verificationCode isEqualToString:_randomStr]) {
        [MBProgressHUD showHUD:self.view meaasge:@"验证码错误"];
        return NO;
    }
    
    if ([NSString isEmptyOrNullWithString:_password]) {
        [MBProgressHUD showHUD:self.view meaasge:@"请输入密码"];
        return NO;
    }
    
    if (_password.length < 6 || _password.length > 20) {
        [MBProgressHUD showHUD:self.view meaasge:@"密码长度为6~20"];
        return NO;
    }
    
    if ([NSString isExistSpaceCharacterWithString:_phoneNum]) {
        [MBProgressHUD showHUD:self.view meaasge:@"含有非法字符，请重新输入"];
        return NO;
    }
    
    if ([NSString isExistSpaceCharacterWithString:_password]) {
        [MBProgressHUD showHUD:self.view meaasge:@"含有非法字符，请重新输入"];
        return NO;
    }
    
    if (!_checkedBtn.selected) {
        [MBProgressHUD showHUD:self.view meaasge:@"是否同意用户协议?"];
        return NO;
    }
    
    return YES;
}

- (BOOL)validateMobile:(NSString *)mobile {//使用正则表达式验证手机号
    
    NSString *phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:mobile];
}

//子线程中
- (void)myTask {
    // Do something usefull in here instead of sleeping ...
    sleep(1);
    // 返回主线程执行
    [self  performSelectorOnMainThread:@selector(goToMainView) withObject:nil waitUntilDone:FALSE];
}

-(void) goToMainView {
    //跳转到登录界面
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
