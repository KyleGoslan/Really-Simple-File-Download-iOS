//
//  NSDateExtensions.swift
//  FileDownload
//
//  Created by Kyle Goslan on 10/08/2015.
//  Copyright (c) 2015 Kyle Goslan. All rights reserved.
//

import Foundation

extension NSDate {
    
    func isGreaterThanDate(dateToCompare : NSDate) -> Bool {
        var isGreater = false
        return self.compare(dateToCompare) == NSComparisonResult.OrderedDescending
    }
    
    func isLessThanDate(dateToCompare : NSDate) -> Bool {
        var isLess = false
        return self.compare(dateToCompare) == NSComparisonResult.OrderedAscending
    }
    
    func addDays(daysToAdd : Int) -> NSDate {
        var secondsInDays : NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
        var dateWithDaysAdded : NSDate = self.dateByAddingTimeInterval(secondsInDays)
        return dateWithDaysAdded
    }
    
    func addHours(hoursToAdd : Int) -> NSDate {
        var secondsInHours : NSTimeInterval = Double(hoursToAdd) * 60 * 60
        var dateWithHoursAdded : NSDate = self.dateByAddingTimeInterval(secondsInHours)
        return dateWithHoursAdded
    }
    
    func addMinutes(minutesToAdd : Int) -> NSDate {
        var secondsInHours : NSTimeInterval = Double(minutesToAdd) * 60
        var dateWithMinutesAdded : NSDate = self.dateByAddingTimeInterval(secondsInHours)
        return dateWithMinutesAdded
    }
    
}