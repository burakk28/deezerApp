//
//  ArtistAlbumViewModel.swift
//  deezerApp
//
//  Created by Burak Kara on 13.05.2023.
//

import Foundation

struct ArtistAlbumViewModel {
    
  let artistAlbum: ArtistAlbum
  
  init(artistAlbum: ArtistAlbum){
    self.artistAlbum = artistAlbum
  }

  var id: Int? {
    return (artistAlbum.id ?? 0)
  }
  var title: String? {
      return (artistAlbum.title ?? "")
    }
    
  var coverMedium: URL? {
    return URL(string: artistAlbum.cover_medium ?? "")
    }
  
  var releaseDate:String?{
    return (artistAlbum.release_date ?? "a")
  }
    
}
