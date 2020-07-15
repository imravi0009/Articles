//
//  Extensions.swift
//  Articles
//
//  Created by Ravi kumar on 15/07/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import Foundation
extension Int{
    
    func getCountFormatted() -> String  {
        var countText = ""
        if self < 1000 {
            countText = "\(self)"
        }
        else if self < 1000000{
            let tempCounts = Double(self) / 1000.0
            countText = "K"
            if self.isMultiple(of: 1000){
                countText = "\(Int(tempCounts))" + countText
            }else{
                let temp =  String(format: "%.1f", tempCounts )
                countText = "\(temp)" + countText
            }
        }
        else if self < 1000000000{
            
            let tempCounts = Double(self) / 1000000.0
            countText = "M"
            if self.isMultiple(of: 1000000){
                countText = "\(Int(tempCounts))" + countText
            }else{
                
                let temp =  String(format: "%.1f", tempCounts )
                countText = "\(temp)" + countText
            }
        }
        return countText
    }
}

extension Date {
    
    func getElapsedInterval() -> String {
        let interval = Calendar.current.dateComponents([.year, .month,.weekday, .day, .hour,.minute,.second], from: self, to: Date())
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year" :
                "\(year)" + " " + "years"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month" :
                "\(month)" + " " + "months"
        }
        else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day" :
                "\(day)" + " " + "days"
        }
        else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " " + "hr" :
                "\(hour)" + " " + "hrs"
        }
        else if let min = interval.minute, min > 0 {
            return min == 1 ? "\(min)" + " " + "min" :
                "\(min)" + " " + "mins"
        }
        else if let sec = interval.second, sec > 0 {
            return sec == 1 ? "\(sec)" + " " + "sec" :
                "\(sec)" + " " + "secs"
        }
        else {
            return "just now"
        }
    }
}
