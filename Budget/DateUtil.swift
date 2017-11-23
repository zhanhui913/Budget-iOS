//
//  DateUtil.swift
//  Budget
//
//  Created by Zhan H. Yap on 2017-11-21.
//  Copyright © 2017 Zhan H. Yap. All rights reserved.
//

import Foundation

class DateUtil {
    
    static func getStartYear(date : Date) -> Date {
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from : date)

        dateComponents.month = 1
        dateComponents.day = 1

        let firstMonth = calendar.date(from: dateComponents)
        
        print("first month is \(firstMonth)")
        
        return firstMonth!
    }
    
    static func getEndYear(date : Date) -> Date {
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from : date)
        
        dateComponents.month = 12
        dateComponents.day = 31
        
        let lastMonth = calendar.date(from: dateComponents)
        
        print("last month is \(lastMonth)")
        
        return lastMonth!
    }
}
