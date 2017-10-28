//
//  Date+Extension.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

extension Date {

    func toString() -> String {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        guard let year = components.year, let month = components.month, let day = components.day else { return "" }
        let yearStr = String(describing: year) + "/"
        let monthStr = String(describing: month) + "/"
        let dayStr = String(describing: day)
        return yearStr + monthStr + dayStr
    }

    func toShortString() -> String {
        let components = Calendar.current.dateComponents([.month, .day], from: self)
        guard let month = components.month, let day = components.day else { return "" }
        return String(month) + "/" + String(day)
    }

    func toQueryString() -> String {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        guard let year = components.year, let month = components.month, let day = components.day else { return "" }
        let yearStr = String(describing: year) + "-"
        let monthStr = String(describing: month) + "-"
        let dayStr = String(describing: day)
        return yearStr + monthStr + dayStr
    }

    func weekday() -> Int {
        return Calendar.current.component(.weekday, from: self)
    }

    func weekdayStr() -> String {
        switch weekday() {
        case 1: return "(日)"
        case 2: return "(月)"
        case 3: return "(火)"
        case 4: return "(水)"
        case 5: return "(木)"
        case 6: return "(金)"
        case 7: return "(土)"
        default: return "(月)"
        }
    }

}
