//
//  UIColor+Extension.m
//
//  Copyright © 2015年 Jonle. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor*) colorWithHex:(NSString *)hexString alpha:(CGFloat)alphaValue
{
    ZLColor * color = [[ZLColor alloc] init];
    NSInteger hexValue = [color returnHexWithColorString:hexString];
    
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor*) colorWithHex:(NSString *)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (NSString *) hexFromUIColor: (UIColor*) color {
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    
    return [NSString stringWithFormat:@"#%x%x%x", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}

@end

@implementation ZLColor

- (NSInteger)returnHexWithColorString:(NSString *)str {
    
    if (str.length == 0) return 0;
    
    NSMutableString * colorStr = [str mutableCopy];
    
    [colorStr deleteCharactersInRange:NSMakeRange(0, 1)];
    [colorStr insertString:@"0x" atIndex:0];
    
    return (NSInteger)strtoull([colorStr UTF8String], 0, 16);
}


@end
