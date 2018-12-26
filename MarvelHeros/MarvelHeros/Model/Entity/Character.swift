//
//  Character.swift
//  MarvelHeros
//
//  Created by Rodrigo Pacheco on 23/12/18.
//  Copyright © 2018 RodrigoPacheco. All rights reserved.
//

import UIKit

class Character: Decodable{
    var name: String
    var description: String
    //var photo: UIImage
    
    init(name: String, description: String){//, photo: UIImage) {
        self.name = name
        self.description = description
       // self.photo = photo
    }
}
