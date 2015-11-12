//
//  UIColor+Extension.h
//  美天
//
//  Created by qianfeng on 15/10/22.
//  Copyright © 2015年 Jonle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
/**
 *  @author Jonle, 15-11-12 10:00 期间
 *
 *  将16进制字符串颜色转换成OC使用颜色
 *
 *  @param hexValue   （#F876987）类型字符串
 *  @param alphaValue 透明度
 *
 *  @return OC Color
 */
+ (UIColor*) colorWithHex:(NSString *)hexValue alpha:(CGFloat)alphaValue;

/**
 *  @author Jonle, 15-11-12 10:00 期间
 *
 *  将16进制字符串颜色转换成OC使用颜色
 *
 *  @param hexValue （#F876987）类型字符串
 *
 *  @return OC Color
 */
+ (UIColor*) colorWithHex:(NSString *)hexValue;


/**
 *  @author Jonle, 15-11-12 10:00 期间
 *
 *  将OC颜色，转换成十六进制颜色XML/HTML类型字符串
 *
 *  @param color OC Color
 *
 *  @return #F..颜色
 */
+ (NSString *) hexFromUIColor: (UIColor*) color;

@end

@interface ZLColor : UIColor

- (NSInteger)returnHexWithColorString:(NSString *)str;

@end
