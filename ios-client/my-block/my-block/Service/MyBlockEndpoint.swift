//
//  MyBlockEndpoint.swift
//  my-block
//
//  Created by Masaya Hayashi on 2017/10/28.
//  Copyright © 2017年 Masaya Hayashi. All rights reserved.
//

import Foundation

protocol MyBlockEndpoint: APIEndpoint {
    var path: String { get }
}

private let myBlockURL = URL(string: "http://localhost:3000/api/v1/")!

extension MyBlockEndpoint {
    var url: URL {
        return URL(string: path, relativeTo: myBlockURL)!
    }
    var headers: [String: String]? {
        return nil
    }
}
