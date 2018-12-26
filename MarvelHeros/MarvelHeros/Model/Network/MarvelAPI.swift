//
//  MarvelAPI.swift
//  MarvelHeros
//
//  Created by Rodrigo Pacheco on 26/12/18.
//  Copyright © 2018 RodrigoPacheco. All rights reserved.
//

import Foundation

enum MarvelAPI {
    case character(String)
    case characters
}

extension MarvelAPI{
    private var baseURL: URL{ return URL(string: "https://gateway.marvel.com")! }
    
    var path: String {
        switch self {
        case .characters:
            return "\(baseURL)/v1/public/characters"
        case .character(let characterId):
            return "\(baseURL)/v1/public/characters/\(characterId)"
        }
    }
}

