//
//  SongViewModel.swift
//  deezerApp
//
//  Created by Burak Kara on 14.05.2023.
//

import Foundation

struct SongDetailViewModel {
  
  let songDetail: SongDetailTracks
  
  init(songDetail: SongDetailTracks) {
      self.songDetail = songDetail
  }
    var id: Int? {
      return (songDetail.id ?? 0)
    }
    
    var title: String? {
      return (songDetail.title ?? "")
    }
  
  var preview: URL? {
    return URL(string: songDetail.preview ?? "")
    }
  
}
