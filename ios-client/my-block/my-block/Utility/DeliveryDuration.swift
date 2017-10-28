//
//  DeliveryDuration.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

enum DeliveryDuration: String {
    case morning = "午前中"
    case daytime = "12:00~15:00"
    case evening = "15:00~18:00"
    case night = "18:00~21:00"
}

func deliveryDuration(for integer: Int) -> String {
    switch integer {
    case 0: return DeliveryDuration.morning.rawValue
    case 1: return DeliveryDuration.daytime.rawValue
    case 2: return DeliveryDuration.evening.rawValue
    case 3: return DeliveryDuration.night.rawValue
    default: return ""
    }
}

func allDeliveryDurations() -> [String] {
    var durations: [String] = []
    durations.append(DeliveryDuration.morning.rawValue)
    durations.append(DeliveryDuration.daytime.rawValue)
    durations.append(DeliveryDuration.evening.rawValue)
    durations.append(DeliveryDuration.night.rawValue)
    return durations
}
