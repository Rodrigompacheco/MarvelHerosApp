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
    
    func request<T: Decodable>(for endpoint: MarvelAPI,
                               completion: @escaping (Result<T>) -> Void) {
        do {
            let url = try endpoint.makeUrl()
            request(for: url, completion: completion)
        } catch {
            completion(.error(errorMessage: "ERR 1"))
        }
        
    }
    
    private func request<T: Decodable>(for url: URL, completion: @escaping (Result<T>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            guard let data = data else {
                completion(.error(errorMessage: "ERR 2"))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let model = try jsonDecoder.decode(T.self, from: data)
                completion(.success(model))
            } catch {
                print(error)
                completion(.error(errorMessage: "ERR 3"))
            }
            }.resume()
    }
    
    
//    func request<T: Decodable>(query: MarvelAPI, completion: @escaping (Result<T>) -> Void) {
//        do {
//            let url = try query.makeUrl()
//
//            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
//                guard let data = data else {
//                    completion(.error(errorMessage: "ERR"))
//                    return
//                }
//
//                let jsonDecoder = JSONDecoder()
//                do {
//                    let model = try jsonDecoder.decode(T.self, from: data)
//                    completion(.success(model))
//                } catch {
//                    completion(.error(errorMessage: "ERR"))
//                }
//                }.resume()
//        }catch {
//            print("ERROR")
//        }
//    }
    
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
