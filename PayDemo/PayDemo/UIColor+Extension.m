//
//  UIColor+Extension.m
//  PayDemo
//
//  Created by Andy on 16/8/31.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)


// Creates a UIColor from a Hex representation string
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    
    if ([hexString rangeOfString:@"#"].location == 0 &&
        [hexString rangeOfString:@"#"].length != 0) {
        
        NSMutableString *tempStr = [NSMutableString stringWithString:hexString];
        hexString =  [tempStr stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
        
    }else if ([hexString rangeOfString:@"#"].length == 0 ||
              [hexString rangeOfString:@"0x"].length == 0) {
        
        NSMutableString *tempStr = [NSMutableString stringWithString:hexString];
        [tempStr insertString:@"0x" atIndex:0];
        hexString = [NSString stringWithFormat:@"%@", tempStr];
    }
    
    unsigned int value;
    [[NSScanner scannerWithString:hexString] scanHexInt:&value];
    
    UIColor *color = [UIColor colorWithRed:((value >> 16) & 0xff) / 255.0 green:((value >> 8) & 0xff) / 255.0 blue:(value & 0xff) / 255.0 alpha:1.0];
    
    return color;
}

@end
