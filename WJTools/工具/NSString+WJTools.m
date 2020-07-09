//
//  NSString+WJTools.m
//  WJTools
//
//  Created by 王杰 on 2020/5/6.
//  Copyright © 2020 王杰. All rights reserved.
//

#import "NSString+WJTools.h"
#import <sys/utsname.h>

//#import <AppKit/AppKit.h>


@implementation NSString (WJTools)
/**
 判断手机号
 */
-(BOOL)wj_isVAlidPhoneNumber
{
    NSString *regex = @"^(13|15|17|18|14)\\d{9}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch =[pred evaluateWithObject:self];
    return isMatch;
}
/**
 判断是否是邮箱
 */
-(BOOL)wj_isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}
/**
判断是否是URL
*/
-(BOOL)wj_isValidUrl
{
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

/**
 判断是否是空字符
 */
- (BOOL)wj_isBlankString{
    if (!self) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!self.length) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [self stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}

/**
 判断密码是否是6-18位并且含数字跟字母
*/
-(BOOL)wj_isPassword {
    NSString * regex = @"^[A-Za-z0-9_]{6,18}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
/**
 字符串转NSData
 */
-(NSData *)wj_convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}
/**
 NSData转字符串
 */
+(NSString *)wj_getStringFromData:(NSData *)data
{
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
/**
 时间戳转时间
 */
-(NSDate *)wj_dateValueWithMillisecondsSince1970 {
    return [NSDate dateWithTimeIntervalSince1970:[self doubleValue] / 1000];
}

/**
 *  计算属性字符文本占用的宽高
 *  @param font    显示的字体
 *  @param maxSize 最大的显示范围
 *  @param lineSpacing 行间距
 *  @return 占用的宽高
 */
-(CGSize)wj_attrStrSizeWithFont:(UIFont *)font andmaxSize:(CGSize)maxSize lineSpacing:(CGFloat)lineSpacing{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    NSDictionary *dict = @{NSFontAttributeName: font,
                           NSParagraphStyleAttributeName: paragraphStyle};
    CGSize sizeToFit = [self boundingRectWithSize:maxSize // 用于计算文本绘制时占据的矩形块
    options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
    attributes:dict        // 文字的属性
    context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    return sizeToFit;
}

#pragma mark - APP相关
/**
 获取系统版本号
 */
+(NSString *)wj_getMyApplicationVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *shortVersion = [info objectForKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@", shortVersion];
}
/**
 获取APP的名字
 */
+(NSString *)wj_getMyApplicationName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
//    NSString *name = [info  objectForKey:@"CFBundleDisplayName"];
//    return [NSString stringWithFormat:@"%@", name];
    return [info objectForKey:@"CFBundleDisplayName"];
}

/**
 获取手机名称
 */
+(NSString *)wj_getMyPhoneName
{
    return [[UIDevice currentDevice] name];
}

/**
 获取设备名称
 */
+(NSString *)wj_getMyDeviceName
{
    return [[UIDevice currentDevice] systemName];
}

/**
 手机型号
 */
+ (NSString *)wj_iphoneType {
    //需要导入头文件：#import <sys/utsname.h
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 plus";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    
    if ([platform isEqualToString:@"iPod1,1"])  return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])  return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])  return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])  return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])  return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])  return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
      
}

/**
 中文转义
 */
- (NSString *)wj_convertChinese{
   return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}
@end
