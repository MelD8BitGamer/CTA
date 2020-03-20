//
//  Model.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/17/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation

// MARK: - Empty
struct ArtWrapper: Codable {
    let artObjects: [ArtObject]

}

// MARK: - ArtObject
struct ArtObject: Codable {
    let links: Links
    let id, objectNumber, title: String
    let hasImage: Bool
    let principalOrFirstMaker, longTitle: String
    let showImage, permitDownload: Bool
    let webImage, headerImage: Image
    let productionPlaces: [String]
}

// MARK: - Image
struct Image: Codable {
    let guid: String
    let offsetPercentageX, offsetPercentageY, width, height: Int
    let url: String
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, web: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case web
    }
}

