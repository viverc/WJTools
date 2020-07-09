//
//  NSString+wj_tools.h
//  WJTools
//
//  Created by 王杰 on 2020/5/6.
//  Copyright © 2020 王杰. All rights reserved.
//

//#import <AppKit/AppKit.h>

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WJTools)
/**
 判断手机号
 */
- (BOOL)wj_isVAlidPhoneNumber;

/**
 判断是否是邮箱
 */
- (BOOL)wj_isValidEmail;

/**
 判断是否是空字符
 */
- (BOOL)wj_isBlankString;

/**
判断是否是URL
*/
- (BOOL)wj_isValidUrl;

/**
 判断密码是否是6-18位并且含数字跟字母
*/
- (BOOL)wj_isPassword;

/**
 字符串转NSData
 */
- (NSData *)wj_convertToData;

/**
 NSData转字符串
 */
+ (NSString *)wj_getStringFromData:(NSData *)data;

/**
 获取系统版本号
 */
+ (NSString *)wj_getMyApplicationVersion;

/**
 获取手机型号
 */
+ (NSString *)wj_iphoneType;

/**
 获取APP的名字
 */
+ (NSString *)wj_getMyApplicationName;

/**
 获取手机的名字
 */
+ (NSString *)wj_getMyPhoneName;

/**
 获取设备名称
 */
+ (NSString *)wj_getMyDeviceName;

/**
 时间戳转时间
 */
- (NSDate *)wj_dateValueWithMillisecondsSince1970;

/**
 *  计算属性字符文本占用的宽高
 *  @param font    显示的字体
 *  @param maxSize 最大的显示范围
 *  @param lineSpacing 行间距
 *  @return 占用的宽高
 */
- (CGSize)wj_attrStrSizeWithFont:(UIFont *)font andmaxSize:(CGSize)maxSize lineSpacing:(CGFloat)lineSpacing;

/**
 中文转义
 */
- (NSString *)wj_convertChinese;


@end

NS_ASSUME_NONNULL_END
