//
//  DeliveryStatus.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

enum DeliveryStatus: String {
    case notShipped = "未発送"
    case shipping = "配送中"
    case delivered = "配送済"
}

func deliveryStatus(for integer: Int) -> String {
    switch integer {
    case 0: return DeliveryStatus.notShipped.rawValue
    case 1: return DeliveryStatus.shipping.rawValue
    case 2: return DeliveryStatus.delivered.rawValue
    default: return ""
    }
}
