//
//  TicketMasterAPIClient.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation
import Firebase

struct TicketMasterAPIClient {
     //TODO: Fix API
    static func getEvents() {
    
    let endpointURL = "https://app.ticketmaster.com/discovery/v2/events/\(eventID).json?apikey=\(Secret.tMasterKey)"
    }
    
    static func getEventDetails() {
        let endpointURL = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=\(Secret.tMasterKey)"
    }
}
