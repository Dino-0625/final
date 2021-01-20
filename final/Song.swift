//
//  Song.swift
//  DemoNetwork
//
//  Created by SHIH-YING PAN on 2020/11/25.
//

import Foundation

struct SongResults: Codable {
   let resultCount: Int
   let results: [Song]
}

struct Song: Codable {
   let artistName: String
   let trackName: String
   let collectionName: String?
   let previewUrl: URL
   let artworkUrl100: URL
   let trackPrice: Double?
   let releaseDate: Date
   let isStreamable: Bool?
}
