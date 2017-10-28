//
//  UpdateDeliveryDateService.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

struct UpdateDeliveryDateService: MyBlockEndpoint {
    var path: String { return "containers/" + String(id) }
    var query: [String : String]? {
        return [
            "date": date,
            "duration": String(duration)
        ]
    }
    var method: HTTPMethod { return .PUT }
    typealias ResponseType = Delivery

    let id: Int
    let date: String
    let duration: Int

    init(deliveryId: Int, newDate: String, newDuration: Int) {
        id = deliveryId
        date = newDate
        duration = newDuration
    }
}
