//
//  SongDetailModel.swift
//  deezerApp
//
//  Created by Burak Kara on 14.05.2023.
//

import Foundation

// MARK: - SongDetailModel
struct SongDetailModel :Decodable{
    let tracks: SongDetail
}

// MARK: - SongDetail
struct SongDetail:Decodable {
    let data: [SongDetailTracks]
}
// MARK: - SongDetailTracks
struct SongDetailTracks:Decodable {
    var id: Int?
    var title: String?
    var preview: String?
}

