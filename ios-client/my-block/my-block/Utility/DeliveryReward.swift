//
//  DeliveryReward.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

func rewards(for weekday: Int) -> [Int] {
    switch weekday {
    case 1, 7:
        return [50, 39, 25, 13]
    default:
        return [25, 50, 39, 13]
    }
}
