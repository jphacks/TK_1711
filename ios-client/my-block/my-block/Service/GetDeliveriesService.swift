//
//  GetDeliveriesService.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

class GetDeliveriesService: MyBlockEndpoint {
    var path: String { return "container" }
    typealias ResponseType = GetDeliveriesResult
}

struct GetDeliveriesResult: JSONDecodable {
    let deliveries: [Delivery]

    init(json: JSONObject) throws {
        self.deliveries = try json.get("container")
    }
}
