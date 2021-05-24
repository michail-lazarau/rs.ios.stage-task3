#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
//     solution 1: stackoverflow.com/questions/4488373/ios-how-to-get-a-proper-month-name-from-a-number
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    if ((monthNumber < 1) || (monthNumber > 13)) {
        return Nil;
    }
    
    NSString *monthName = [[formatter monthSymbols] objectAtIndex:(monthNumber-1)];
    return monthName;
    
//    solution 2: wierd
//    NSDateFormatter *formatter = [NSDateFormatter new];
//    formatter.dateFormat = @"MMMM";
//
//    NSDateComponents *components = [[NSDateComponents alloc] init];
//    [components setMonth:monthNumber];
//
//    NSCalendar* calendar = [NSCalendar currentCalendar];

//
//    NSDate *date = [calendar dateFromComponents:components];
//    NSString *monthName = [formatter stringFromDate:date];
//
//    return monthName;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSString *dateFormatString = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = dateFormatString;
    
    NSDate *dateFromString = [dateFormatter dateFromString: date];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:dateFromString];

    return [components day];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    
    long weekDayIndex = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:date].weekday - 1;
    
    return date != Nil ? [[dateFormatter shortWeekdaySymbols] objectAtIndex: weekDayIndex] : Nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {

    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDate *startOfTheWeek;
    NSDate *endOfTheWeek;
    NSTimeInterval interval;
    [cal rangeOfUnit:NSWeekCalendarUnit
           startDate:&startOfTheWeek
            interval:&interval
             forDate:now];
    
    endOfTheWeek = [startOfTheWeek dateByAddingTimeInterval:interval-1];
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    dateFormatter.dateFormat = @"dd-MM-yyyy";
//    NSDate *startOfTheWeek = [dateFormatter dateFromString:@"17-05-2021"];
//    NSDate *endOfTheWeek = [dateFormatter dateFromString:@"23-05-2021"];

    NSDateInterval *dateInterval = [[NSDateInterval alloc] initWithStartDate:startOfTheWeek endDate:endOfTheWeek];

    return [dateInterval containsDate:date];
    
//    NSTimeInterval difference = (double)604800;
//    return [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate:&startOfTheWeek interval:&difference forDate:date];
}

@end
