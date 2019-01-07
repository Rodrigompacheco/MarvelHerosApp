//
//  ViewController.swift
//  MarvelHeros
//
//  Created by Rodrigo Pacheco on 23/12/18.
//  Copyright © 2018 RodrigoPacheco. All rights reserved.
//

import UIKit

class CharacterListVC: UIViewController {

    @IBOutlet weak var characListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let shared = MarvelAPIManager.shared
        
        let json = shared.request(for: .characters) { (result: Result<DataPackage<Character>>) in
            print(result)
        }
    }


}

