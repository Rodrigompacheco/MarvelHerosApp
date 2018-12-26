//
//  MarvelAPIManager.swift
//  MarvelHeros
//
//  Created by Rodrigo Pacheco on 26/12/18.
//  Copyright © 2018 RodrigoPacheco. All rights reserved.
//

import Foundation

enum Result<T>{
    case success(T)
    case error(errorMessage: String)
}

class MarvelAPIManager {
    
    static var shared = MarvelAPIManager()
    
    private init() {}
    
    func request(query: MarvelAPI) -> Data {
        guard let url = URL(string: query.path) else { return Data() }
        
        var result: Data?
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return  }
            
            result = data
        }
        return result!
    }
    
//    func request(query: MarvelAPI, completion: @escaping (Result<Data>) ->()) {
//        guard let url = URL(string: query.path) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//            guard let data = data else {
//                completion(.error(errorMessage: "Error in data of the URLSession"))
//                return }
//
//            completion(.success(data))
//        }
//    }
}
