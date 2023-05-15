//
//  MusicModel.swift
//  deezerApp
//
//  Created by Burak Kara on 9.05.2023.
//

import Foundation

 // MARK: -MusicModel

struct MusicModel:Decodable {
  let data : [MusicMain]
}
struct MusicMain : Decodable {
  var id:Int?
  var name : String?
  var picture_medium :String?
}
