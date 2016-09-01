//
//  PassWordView.m
//  PayDemo
//
//  Created by Andy on 16/8/31.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "PassWordView.h"

@implementation PassWordView


- (instancetype)initWithFrame:(CGRect)frame
{


    if (self = [super initWithFrame:frame]) {
        [self  layoutUI];

        
    }

    return self;

}

- (UITextField *)topTX
{

    if (!_topTX) {
        
        _topTX = [[UITextField alloc]init];
        _topTX.keyboardType =  UIKeyboardTypeNumberPad;
        [_topTX addTarget:self action:@selector(txchange:) forControlEvents:UIControlEventEditingChanged];
        [self  addSubview:_topTX];
    }

    return _topTX;

}

- (void)layoutUI
{


  

    
    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-224)];
    bg.backgroundColor = [UIColor colorFromHexString:@"#fffffa"];
    [self  addSubview:bg];
    
    UIButton *title = [UIButton buttonWithType:UIButtonTypeCustom];
    title.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    [title  setTitle:@"输入密码" forState:UIControlStateNormal];
    title.titleLabel.font = [UIFont  systemFontOfSize:16.0];
    [title  setTitleColor:[UIColor colorFromHexString:@"#222222"] forState:UIControlStateNormal];
    [bg addSubview:title];
    
    UIButton *returnView = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    [returnView  setImage:[UIImage imageNamed:@"arrow1"] forState:UIControlStateNormal];
    [returnView addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
    [bg  addSubview:returnView];
    
    //输入密码下方的分割线
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 1)];
    line.backgroundColor = [UIColor colorFromHexString:@"#f2f2f2"];
    [bg  addSubview:line];
    
  
    UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-300*BJautoSizeSalseX)/2, 100, 300*BJautoSizeSalseX, 40)];
    whiteView.backgroundColor = [UIColor clearColor];
    [bg  addSubview:whiteView];
    
  
    UIButton *btn = [UIButton  buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0 ,0, 300*BJautoSizeSalseX, 40);
    [btn setImage:[UIImage imageNamed:@"inputPassword"] forState:UIControlStateNormal];
    [whiteView addSubview:btn];
    
    
    _dataSource = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < 6; i++)
    {
        UITextField *pwdLabel = [[UITextField alloc] initWithFrame:CGRectMake(50*i+10, 0, 55, 40)];
        pwdLabel.enabled = NO;
        pwdLabel.textAlignment = NSTextAlignmentCenter;//居中
        pwdLabel.secureTextEntry = YES;//设置密码模式
        [whiteView addSubview:pwdLabel];
        [_dataSource addObject:pwdLabel];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tap];
    
}
- (void)tap{


     [self.topTX  becomeFirstResponder];

}

#pragma mark 文本框内容改变
- (void)txchange:(UITextField *)tx
{
    
    
    NSString *password = tx.text;
  
    
    for (int i = 0; i <_dataSource.count; i++)
    {
        UITextField *pwdtx = [_dataSource objectAtIndex:i];
        
            if (i < password.length)
            {
                //获取每个小文本框的text
                NSString *pwd = [password substringWithRange:NSMakeRange(i, 1)];
                pwdtx.text = pwd;
            }
            //删除操作
            else
            {
                pwdtx.text = @"";
                
            }
       
    }
  
    
        if (password.length == 6)
        {
            //密码验证  根据具体需求操作
            if ([password isEqualToString:@"123456"]) {
                
           
                if ([self.delegate  respondsToSelector:@selector(pushToSuccessView)]) {
                    [self.delegate  pushToSuccessView];
                }
               
                
            }else{
               
                
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"      你输入的密码不正确               请你重新输入" message:nil delegate:nil cancelButtonTitle:@"取消"  otherButtonTitles:@"重新输入", nil];
                alert.delegate =self;
                [alert show];
                
            }
        
        }
    //输入密码达到指定长度后不再继续输入
    if (password.length > 6) {
        
        tx.text = [tx.text  substringToIndex:6];
    }
}



#pragma mark--- UIAlertView 代理

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex == 1) {

        //密码错误  清空文本框
        [self  textDidChange];

}
    

}


//清空文本框
- (void)textDidChange
{

     _topTX.text = @"";

    
    for (int i = 0; i <_dataSource.count; i++)
    {
        
        
        UITextField *pwdtx = [_dataSource objectAtIndex:i];
        
     
            pwdtx.text = @"";
        
        
    }



}


- (void)show
{

    //弹出数字键盘
    [self.topTX  becomeFirstResponder];
    [UIView animateWithDuration:0.1 animations:^{
        self.hidden = NO;
        
        CGRect frame = self.frame;
        frame.origin.y = 244.0;
        self.frame = frame;
    } completion:^(BOOL finished) {
       
    }];
   
}

-(void)hidden
{

    [self.topTX  resignFirstResponder];
    [UIView animateWithDuration:0.1 animations:^{
         self.hidden = YES;

        CGRect frame = self.frame;
        frame.origin.y = SCREEN_HEIGHT;
        self.frame = frame;
    } completion:^(BOOL finished) {
        
        //收起界面后清空密码
        [self  textDidChange];
    }];

  
}






@end
