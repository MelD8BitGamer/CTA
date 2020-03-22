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
    let objectNumber: String
    let hasImage: Bool
    let longTitle: String
    let webImage: Image
}

// MARK: - Image
struct Image: Codable {
    let url: String
}


