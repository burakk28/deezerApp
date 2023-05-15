//
//  ArtistAlbumModel.swift
//  deezerApp
//
//  Created by Burak Kara on 13.05.2023.
//

import Foundation

// MARK: - ArtistAlbumModel
struct ArtistAlbumModel: Decodable {
    let data: [ArtistAlbum]
}

// MARK: - ArtistAlbum
struct ArtistAlbum: Decodable {
  var id: Int?
  var title: String?
  var cover_medium: String?
  var release_date: String?
  
}


