//
//  ArtistViewModel.swift
//  deezerApp
//
//  Created by Burak Kara on 11.05.2023.
//

import Foundation

struct ArtistViewModel {
  
  let artistModel:ArtistModel
  
  init(artistModel: ArtistModel){
    self.artistModel = artistModel
  }
  var id: Int?{
    return (artistModel.id ?? 0)
  }
  var name: String?{
    return "\(artistModel.name ?? "")"
  }
  var picture: URL?{
    return URL(string: artistModel.picture_big ?? "")
  }

}


