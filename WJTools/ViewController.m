//
//  ViewController.m
//  WJTools
//
//  Created by 王杰 on 2020/4/20.
//  Copyright © 2020 王杰. All rights reserved.
//

#import "ViewController.h"
#import "NSString+WJTools.h"
#import "WJTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Wj_colorWithHex(0xFFFFFF);
    NSString * phone = @"13818481234";
//    NSLog(@"是否是手机号%d",[phone wj_isVAlidPhoneNumber]);
//    NSLog(@"获取版本号%@",[NSString wj_iphoneType]);
    NSLog(@"%@",[WJTools dateTransformDateStr:[NSDate date]]);
    // Do any additional setup after loading the view.
}

#pragma mark - APP相关
@end
