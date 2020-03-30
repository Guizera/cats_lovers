//
//  catsModel.swift
//  cats_lovers
//
//  Created by José Alves da Cunha on 29/03/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import Foundation
import SwiftyJSON

class CatsItems {
    
    var image: String
    
    init(image: String) {
        self.image = image
    }
    func initJSON(json: JSON) -> CatsItems? {
        if let image = json["link"].string {
            return CatsItems(image: image)
        } else {
            print("nenhuma imagem de gato recuperada")
            return nil
        }
    }
    
}
