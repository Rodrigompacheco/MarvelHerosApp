//
//  DataContainer.swift
//  MarvelHeros
//
//  Created by Rodrigo Pacheco on 06/01/19.
//  Copyright © 2019 RodrigoPacheco. All rights reserved.
//

import Foundation

struct DataPackage<T>: Decodable where T: Decodable {
    let data: DataContainer<T>
}

struct DataContainer<T>: Decodable where T: Decodable  {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [T]
}
