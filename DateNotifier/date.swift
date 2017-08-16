//
//  date.swift
//  DateNotifier
//
//  Created by Chaosward on 2017-01-29.
//  Copyright © 2017 Ward&Laos. All rights reserved.
//

import Foundation

class DateInfo{
    
    private var title = ""
    private var weekdayString = ""
    private var weekString = ""
    
    init() {
        let date = Date()
        let calender = Calendar.current
        let dateFormat = DateFormatter()
        
        let month = calender.component(.month, from: date)-1
        let weekday = calender.component(.weekday, from: date)-1
        
        
        let week = calender.component(.weekOfYear, from: date)
        let day = calender.component(.day, from: date)
        
        let monthStr = dateFormat.monthSymbols[month]
        let weekdayStr = dateFormat.weekdaySymbols[weekday]

        
        //Find a way to get what weather it is everyday
        
        title = "Today it is the \(day) of \(monthStr)"
        weekdayString = "It is a \(weekdayStr)"
        weekString = "Week \(week)"
        
    }
    
    public func getTitle() -> String{
        return title
    }
    public func getWeekday() -> String{
        return weekdayString
    }
    public func getWeek() -> String{
        return weekString
    }
}


