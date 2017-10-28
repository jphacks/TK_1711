//
//  Delivery.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

class Delivery: JSONDecodable {
    let name: String
    let date: String
    let status: Int

    required init(json: JSONObject) throws {
        name = try json.get("name")
        date = try json.get("date")
        status = try json.get("status")
    }
}
