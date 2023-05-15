//
//  MusicViewModel.swift
//  deezerApp
//
//  Created by Burak Kara on 9.05.2023.
//

import Foundation

struct MusicViewModel {
  
  let musicMain:MusicMain
  
  init(musicMain: MusicMain) {
    self.musicMain = musicMain
  }

  var id:Int?{
    return (musicMain.id ?? 0)
  }
  var musicName:String?{
    return "\(musicMain.name ?? "")"
  }
  var picture_medium :URL?{
    return URL(string:musicMain.picture_medium ?? "")
  }

}
