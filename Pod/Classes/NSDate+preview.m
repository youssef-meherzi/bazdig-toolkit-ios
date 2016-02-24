//
//  NSDate+preview.m
//  Pods
//
//  Created by Youssef Meherzi on 24/02/2016.
//
//

#import "NSDate+preview.h"

@implementation NSDate (preview)

-(NSString *) bz_previewWithTime:(BOOL) displayTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *today = [NSDate date];
    NSDateComponents *yesterday = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                                   fromDate:[today dateByAddingTimeInterval:-60*60*24]];
    NSDateComponents *now = [[NSCalendar currentCalendar]
                             components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                             fromDate:today];
    NSDateComponents *event = [[NSCalendar currentCalendar]
                               components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                               fromDate:self];
    if ((now.year == event.year) && (now.month == event.month) && (now.day == event.day)) {
        if (displayTime) {
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [formatter setDateStyle:NSDateFormatterNoStyle];
            return [formatter stringFromDate:self];
        } else {
            return NSLocalizedString(@"Today", nil);
        }
    } else if ((yesterday.year == event.year) && (yesterday.month == event.month) && (yesterday.day == event.day)) {
        return NSLocalizedString(@"Yesterday", nil);
    } else if (fabs([self timeIntervalSinceDate:today]) < 60*60*24*7) {
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        [formatter setDateFormat:@"EEEE"];
        NSString *txt = [formatter stringFromDate:self];
        return [txt stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[txt substringToIndex:1] uppercaseString]];
    } else if (now.year == event.year) {
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        [formatter setDateFormat:@"d MMMM"];
        return [formatter stringFromDate:self];
    } else {
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterNoStyle];
        return [formatter stringFromDate:self];
    }
}

@end
