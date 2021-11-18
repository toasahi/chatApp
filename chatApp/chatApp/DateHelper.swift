//
//  DateHelper.swift
//  chatApp
//
//

import Foundation

extension Date{
    
    func descriptionString(dateStyle:DateFormatter.Style = .short) -> String {
        let dateFomatter = DateFormatter()
        dateFomatter.locale = Locale(identifier: "ja_JP")
        dateFomatter.dateStyle = dateStyle
        let daysBetween = self.daysBetween(date: Date())
        if(daysBetween == 0){
            return "Today"
        }else if(daysBetween == 1){
            return "Yestarday"
        }else if(daysBetween < 5){
            let weekIndex = Calendar.current.component(.weekday, from: self) - 1
            return dateFomatter.weekdaySymbols[weekIndex]
        }
        return dateFomatter.string(from: self)
    }
    
    func daysBetween(date:Date) -> Int{
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        //date2 - date1の計算
        if let daysBetween = calendar.dateComponents([.day],from:date1,to:date2).day{
            return daysBetween
        }
        return 0
    }
    
}
