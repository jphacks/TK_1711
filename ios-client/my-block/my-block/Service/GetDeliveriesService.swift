//
//  GetDeliveriesService.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

struct GetDeliveriesService: MyBlockEndpoint {
    var path: String { return "containers" }
    typealias ResponseType = GetDeliveriesResult
    var query: [String : String]? { return ["id": String(id)] }

    let id: Int

    init(id: Int) {
        self.id = id
    }
}

struct GetDeliveriesResult: JSONDecodable {
    let deliveries: [Delivery]
    let balance: Int

    init(json: JSONObject) throws {
        deliveries = try json.get("container")
        balance = try json.get("balance")
    }
}
