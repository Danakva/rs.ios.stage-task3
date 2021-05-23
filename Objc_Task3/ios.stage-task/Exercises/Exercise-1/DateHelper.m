#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSDateFormatter *ex1 = [NSDateFormatter new];
    if (monthNumber > 12 || monthNumber < 1) {
        return nil;
    }
    return [[ex1 monthSymbols] objectAtIndex:(monthNumber-1)];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *ex2 = [NSDateFormatter new];
    ex2.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDate *dateFromString = [ex2 dateFromString:date];
    if (date == nil) {
        return 0;
    }
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate: dateFromString];
    return [components day];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *weekday = [NSDateFormatter new];
    weekday.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    [weekday setLocale:weekday.locale];
    [weekday setDateFormat: @"EE"];
    return [weekday stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate: [NSDate date]];
    NSUInteger todaysWeek = [components weekOfYear];
    NSDateComponents *otherComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate: date];
    NSUInteger datesWeek = [otherComponents weekOfYear];
    return todaysWeek == datesWeek;
}
@end
