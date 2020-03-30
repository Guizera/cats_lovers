//
//  imgurApi.swift
//  cats_lovers
//
//  Created by José Alves da Cunha on 28/03/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class getCatsRequest {
    
    static func getCats(completion: @escaping(_ message: String?, _ catsItems: [CatsItems]?) -> Void) {
        
        let clientId: String = "1ceddedc03a5d71"
        let secretClient: String = "63775118a9f912fd91ed99574becf3b375d9eeca"
        let urlApi: String = "https://api.imgur.com/3/gallery/search/"
        guard let url = URL(string: urlApi) else {
            return
        }
        
        let allParameters = [
            "client_id": clientId,
            "client_secret": secretClient,
            "grant_type" : "client_credentials",
            "q": "cats"
        ]
        let headers:HTTPHeaders = [
            "Authorization": "Client-ID \(clientId)"
        ]
        AF.request(url, method: .get, parameters: allParameters, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let data = json["data"].array
                var cats = [CatsItems]()
                for item in data ?? [] {
                    let galleryItem = CatsItems(image: item["images"][0]["link"].stringValue)
                    cats.append(galleryItem)
                }
                completion(nil, cats)
            case .failure(let error):
                completion(error.errorDescription, nil)
            }
            
            
        }
        
        
        
    }
    
}
