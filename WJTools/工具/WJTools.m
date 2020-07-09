//
//  WJTools.m
//  WJTools
//
//  Created by 王杰 on 2020/4/20.
//  Copyright © 2020 王杰. All rights reserved.
//

#import "WJTools.h"

@implementation WJTools
/**
时间戳转字符串
*/
+(NSString * )dateTransformDateStr:(NSDate * )date{
     NSDateFormatter *matter = [[NSDateFormatter alloc] init];
     [matter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     NSString *dateStr = [matter stringFromDate:date];
     return dateStr;
}

/**
 字符串转时间戳
*/
+(NSDate *)dateStrTransformtimeStamp:(NSString * )timeStr{
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    [matter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [matter dateFromString:timeStr];
    return date;
}

@end
