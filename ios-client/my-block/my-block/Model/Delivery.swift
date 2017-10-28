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
    let date: String
    let status: String
    let duration: String

    required init(json: JSONObject) throws {
        func dateString(date: String) -> String {
            let arr = date.split(separator: "-")
            return arr[0] + "年" + arr[1] + "月" + arr[2] + "日"
        }

        id = try json.get("id")
        name = try json.get("name")
        date = dateString(date: try json.get("date"))
        status = deliveryStatus(for: try json.get("status"))
        duration = deliveryDuration(for: try json.get("duration"))
    }

}
