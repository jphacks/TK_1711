//
//  Delivery.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

class Delivery: JSONDecodable {
    let id: Int
    let name: String
    let date: Date
    let status: DeliveryStatus
    let statusStr: String
    let duration: DeliveryDuration
    let durationStr: String
    let photoUrl: URL

    required init(json: JSONObject) throws {
        id = try json.get("id")
        name = try json.get("name")
        status = deliveryStatus(for: try json.get("status"))
        statusStr = deliveryStatusStr(for: try json.get("status"))
        durationStr = deliveryDurationStr(for: try json.get("duration"))
        duration = deliveryDuration(for: try json.get("duration"))
        photoUrl = try json.get("photo")

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "GMT")
        dateFormatter.dateFormat = "YYYY-MM-dd"
        date = dateFormatter.date(from: try json.get("date")) ?? Date()
    }

}
