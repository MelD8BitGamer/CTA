//
//  APIClient.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//
import UIKit
import Alamofire

struct APIClient {
    //TODO: Fix model
    static func fetchArt(completion: @escaping (AFResult<[ArtObject]>) -> ()) { //or ArtWrapper
        //CompilerErrorGeneric type 'Result' specialized with too few type parameters (got 1, but expected 2) so you need to put AF in front of RESULT
        let endpointURLString = "https://www.rijksmuseum.nl/api/en/collection?key=\(Secret.APIKey)&p\(<#T#>)"
        
        // we need a URL
        guard let url = URL(string: endpointURLString) else {
            return
        }
        //update wants us to change from Alamofire to AF
        AF.request(url).response { (response) in
            //response.data
            //response.error
            //response.request
            if let error = response.error {
                
            } else if let data = response.data {
                do{
                    let results = try JSONDecoder().decode(ArtWrapper.self, from: data)
                    if let artPiece = results.artObjects.first {
                        completion(.success([artPiece]))
                    }
                    
                } catch {
                    print("did not work")
                    //completion(.failure(error))
                }
            }
        }
    }
    
}
