//
//  DateExtensions.swift
//  HabitualTracker
//
//  Created by Jackson Ho on 11/25/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import Foundation
extension Date{
    
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
    
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    
    var isYesterday: Bool{
        let calendar = Calendar.current
        return calendar.isDateInYesterday(self)
    }
}
