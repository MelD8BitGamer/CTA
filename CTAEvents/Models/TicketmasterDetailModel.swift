//
//  TicketmasterDetailModel.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation

//MARK: Events
struct Events: Codable {
    let name: String
    let type: String
    let id: String
    let images: [EventImages]
    let sales: Sales
    let dates: EventDates
    let info: String?
    let priceRanges: [PriceRange]
    let accessibility: Accessibility?
}

// MARK: - Accessibility
struct Accessibility: Codable {
    let info: String
}
// MARK: - Dates
struct EventDates: Codable {
    let start: Start
}

// MARK: - Start
struct Start: Codable {
    let localDate: String
    let localTime: String
    let dateTime: Date
}
// MARK: - Image
struct EventImages: Codable {
    let url: String
}

// MARK: - PriceRange
struct PriceRange: Codable {
    let min: Double
    let max: Double
}

//MARK: - Sales
struct Sales: Codable {
    let salesPublic: Public
}

// MARK: - Public
struct Public: Codable {
    let startDateTime: Date
    let endDateTime: Date
}
