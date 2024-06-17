//
//  models.swift
//  iTuneArtist
//
//  Created by Kuldeep Singh on 6/12/24.
//

import Foundation

struct SearchResult: Codable {
    let results: [ArtistInfo]
}

struct ArtistInfo: Codable {
    let artistName: String?
    let country: String?
    let primaryGenreName: String?
    let collectionPrice: Double?
    let artworkUrl60: String?
}
