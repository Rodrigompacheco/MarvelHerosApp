//
//  CharactersDataSource.swift
//  MarvelHeros
//
//  Created by Rodrigo Pacheco on 26/12/18.
//  Copyright © 2018 RodrigoPacheco. All rights reserved.
//

import Foundation

class CharactersDataSource{
    
    static var shared = CharactersDataSource()
    let marvelAPIManager = MarvelAPIManager.shared
    
    private init() {}
    
    func getAllCharacters() -> [Character]{
        let endpoint = MarvelAPI.characters

        let data = marvelAPIManager.request(for: endpoint) { (result: Result<Character>) in
            print(result)
        }
        
        
//        let data = marvelAPIManager.request(query: .characters, completion: Collection)

//        do {
//            let characters = try JSONDecoder().decode([Character].self, from: data)
//            return characters
//        } catch let jsonErr{
//            print("Erro", jsonErr)
//            return []
//        }
        return []
    }
    
    func getCharacter(characterId id: String) -> Character? {
//        let data = marvelAPIManager.request(query: .character(id))
//        do {
//            let character = try JSONDecoder().decode(Character.self, from: data)
//            return character
//        } catch let jsonErr{
//            print("Erro", jsonErr)
//            return nil
//        }
        return nil
    }
}
