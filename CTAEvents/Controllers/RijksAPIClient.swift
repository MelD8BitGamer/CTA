//
//  APIClient.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//
import UIKit
import Alamofire

struct RijksAPIClient {
    //TODO: Fix API
    static func fetchArt(searchQuery: String, completion: @escaping (AFResult<[ArtObject]>) -> ()) { //or ArtWrapper
        //        CompilerErrorGeneric type 'Result' specialized with too few type parameters (got 1, but expected 2) so you need to put AF in front of RESULT
        let endpointURLString = "https://www.rijksmuseum.nl/api/en/collection?key=\(Secret.RijksAPIKey)&q=\(searchQuery)"
        
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
                completion(.failure(error))
            } else if let data = response.data {
                do{
                    let results = try JSONDecoder().decode(ArtWrapper.self, from: data)
                    if let artPiece = results.artObjects.first {
                        completion(.success([artPiece]))
                    }
                    
                } catch {
                    completion(.failure(.createURLRequestFailed(error: error)))
                }
            }
        }
    }
    
    static func fetchDetailedArt(objectNumber: String, completion: @escaping (AFResult<DetailedArtObject>) ->()) {
        
        let endpointURLString = "https://www.rijksmuseum.nl/api/en/collection/\(objectNumber)?key=\(Secret.RijksAPIKey)"
        guard let url = URL(string: endpointURLString) else {
            return
        }
        //update wants us to change from Alamofire to AF
        AF.request(url).response { (response) in
            //response.data
            //response.error
            //response.request
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do{
                    let results = try JSONDecoder().decode(ArtDetailWrapper.self, from: data)
                    completion(.success(results.artObject))
                    
                } catch {
                    completion(.failure(.createURLRequestFailed(error: error)))
                }
            }
        }
    }
    
}
