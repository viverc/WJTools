//
//  WJTools.h
//  WJTools
//
//  Created by 王杰 on 2020/4/20.
//  Copyright © 2020 王杰. All rights reserved.
//  iOS常用的工具

#import <Foundation/Foundation.h>
/**
 屏幕宽度
 */
#define Wj_screenWidth [UIScreen mainScreen].bounds.size.width

/**
屏幕高度
*/
#define Wj_screenHeight [UIScreen mainScreen].bounds.size.height

/**
 十六进制颜色
 格式Wj_colorWithHex(0xFFFFFF)
 */
#define Wj_colorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
                blue :((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]



NS_ASSUME_NONNULL_BEGIN

@interface WJTools : NSObject
/**
 时间戳转字符串
 */
+(NSString * )dateTransformDateStr:(NSDate * )date;

/**
 字符串转时间戳
*/
+(NSDate *)dateStrTransformtimeStamp:(NSString * )timeStr;



@end

NS_ASSUME_NONNULL_END
