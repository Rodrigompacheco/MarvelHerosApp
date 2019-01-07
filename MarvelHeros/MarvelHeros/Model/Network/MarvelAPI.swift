//
//  MarvelAPI.swift
//  MarvelHeros
//
//  Created by Rodrigo Pacheco on 26/12/18.
//  Copyright © 2018 RodrigoPacheco. All rights reserved.
//

import Foundation

enum URLError: Error {
    case invalidURL
}

enum MarvelAPI {
    case character(String)
    case characters
}

extension MarvelAPI{
    private var baseURL: URL{ return URL(string: "https://gateway.marvel.com:443")! }
    
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .character(let characterId):
            return "/v1/public/characters/\(characterId)"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems: [URLQueryItem] = MarvelConfig.asURLQueryitems()
//        switch self {
//        case .characters, .character(<#T##String#>):
//            queryItems.append(URLQueryItem(name: "offset", value: offset.description))
//        }
        return queryItems
    }
    
    func makeUrl() throws -> URL {
        var components = URLComponents(string: "\(baseURL)\(path)")
        components?.queryItems = queryItems

        guard let url = components?.url else {
            throw URLError.invalidURL
        }
        
        return url
    }
}

