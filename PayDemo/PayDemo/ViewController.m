//
//  ViewController.m
//  PayDemo
//
//  Created by Andy on 16/8/31.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "ViewController.h"



@interface ViewController (){
    
    
    PassWordView *_passView;
    
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //支付界面
    _passView = [[PassWordView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-224)];
    _passView.hidden = YES;
    _passView.delegate = self;
    [self.view  addSubview:_passView];
    
    
}



//弹出支付界面
- (IBAction)showPasswordView:(id)sender {
    
  
        
    [_passView  show];

}





#pragma mark  ---- PassWordViewDelegate

- (void)pushToSuccessView
{

    UIAlertController *alert = [UIAlertController  alertControllerWithTitle:@"提示" message:@"密码输入成功" preferredStyle:UIAlertControllerStyleAlert];
   
    UIAlertAction *sureBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert  addAction:sureBtn];
    
    [self  presentViewController:alert animated:YES completion:nil];




}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
