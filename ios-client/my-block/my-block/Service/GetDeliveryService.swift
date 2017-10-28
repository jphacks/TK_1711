//
//  GetDeliveryService.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

struct GetDeliveryService: MyBlockEndpoint {
    var path: String { return "containers/" + String(id) }
    typealias ResponseType = Delivery

    let id: Int

    init(id: Int) {
        self.id = id
    }
}
