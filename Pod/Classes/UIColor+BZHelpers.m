//
//  UIColor+BZHelpers.m
//  Pods
//
//  Created by Youssef MEHERZI on 2/26/16.
//
//

#import "UIColor+BZHelpers.h"

@implementation UIColor (BZHelpers)

+(UIColor *) bz_colorFromHex:(NSString *) keyColor {
    if (!keyColor) {
        NSLog(@"ERROR : Trying to create color from nil");
        return nil;
    }
    if (![[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"#?[0-9a-fA-F]+"] evaluateWithObject:keyColor]) {
        NSLog(@"ERROR : Invalid color code");
        return nil;
    }
    if ([keyColor hasPrefix:@"#"])
        keyColor = [keyColor substringFromIndex:1];
    unsigned int c;
    CGFloat r, g, b, a;
    [[NSScanner scannerWithString:keyColor] scanHexInt:&c];
    if (keyColor.length == 3 || keyColor.length == 4) {
        a = keyColor.length == 4 ? ((c & 0xf000) >> 12)/(float)0xf : 1;
        r = ((c & 0xf00) >> 8)/(float)0xf;
        g = ((c & 0xf0) >> 4)/(float)0xf;
        b = (c & 0xf)/(float)0xf;
    } else if (keyColor.length == 6 || keyColor.length == 8) {
        a = keyColor.length == 8 ? ((c & 0xff000000) >> 24)/(float)0xff : 1;
        r = ((c & 0xff0000) >> 16)/(float)0xff;
        g = ((c & 0xff00) >> 8)/(float)0xff;
        b = (c & 0xff)/(float)0xff;
    } else {
        NSLog(@"ERROR : Invalid color length");
        return nil;
    }
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end
