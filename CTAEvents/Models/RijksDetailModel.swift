//
//  RijksDetailModel.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation

struct ArtDetailWrapper: Codable {
    let artObject: DetailedArtObject
}

// MARK: - ArtObject
struct DetailedArtObject: Codable {
    let objectNumber: String
    let title: String
    let webImage: WebImage
    let plaqueDescriptionEnglish: String
    let principalMaker: String
    let location: String
}


// MARK: - WebImage
struct WebImage: Codable {
    let url: String
}


