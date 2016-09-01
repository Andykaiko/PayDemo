//
//  PassWordView.h
//  PayDemo
//
//  Created by Andy on 16/8/31.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PassWordViewDelegate <NSObject>

- (void)pushToSuccessView;

@end

@interface PassWordView : UIView<UIAlertViewDelegate>

@property (nonatomic,strong) UITextField *topTX;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,weak) __weak id <PassWordViewDelegate>delegate;

- (void)textDidChange;
- (void)show;
- (void)hidden;

@end
