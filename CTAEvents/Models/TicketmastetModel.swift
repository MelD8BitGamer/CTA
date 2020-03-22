//
//  TicketmastetModel.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation

//MARK: Empty
struct TicketMasterWrapper: Codable{
    let events: [TicketEvent]
}

// MARK: - Empty
struct TicketEvent: Codable {
    let name: String
    let id: String
    let url: String
    let images: [PicImage]
    let dates: Dates
}

// MARK: - Dates
struct Dates: Codable {
    let status: Status
}

// MARK: - Status
struct Status: Codable {
    let code: String
}

// MARK: - Image
struct PicImage: Codable {
    let url: String
}
