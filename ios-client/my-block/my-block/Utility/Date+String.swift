//
//  Date+String.swift
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
        let yearStr = String(describing: year) + "年"
        let monthStr = String(describing: month) + "月"
        let dayStr = String(describing: day) + "日"
        return yearStr + monthStr + dayStr
    }

    func toShortString() -> String {
        let components = Calendar.current.dateComponents([.month, .day], from: self)
        guard let month = components.month, let day = components.day else { return "" }
        return String(month) + "/" + String(day)
    }

}
