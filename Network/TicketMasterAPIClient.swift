//
//  TicketMasterAPIClient.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation
import Alamofire

struct TicketMasterAPIClient {
    //TODO: Fix API
    static func getEvents(cityQuery: String? = nil, postalQuery: String? = nil, keywordQuery: String? = nil, completion: @escaping (AFResult<TicketEvent>) -> ()) {
        var endpointURLString = ""
        if let cityQuery = cityQuery{ endpointURLString = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=\(Secret.tMasterKey)&city=\(cityQuery)" } else if let postalQuery = postalQuery { endpointURLString = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=\(Secret.tMasterKey)&postalcode=\(postalQuery)"
        } else if let keywordQuery = keywordQuery { endpointURLString = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=\(Secret.tMasterKey)&keyword=\(keywordQuery)" }
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
                    let results = try JSONDecoder().decode(TicketEvent.self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(.createURLRequestFailed(error: error)))
                }
            }
        }
    }
    
    
    static func getEventDetails(eventID: String, completion: @escaping (AFResult<Events>) -> ()) {
        let endpointURLString = "https://app.ticketmaster.com/discovery/v2/events/\(eventID).json?apikey=\(Secret.tMasterKey)"
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
                    let results = try JSONDecoder().decode(Events.self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(.createURLRequestFailed(error: error)))
                }
            }
        }
    }
}
