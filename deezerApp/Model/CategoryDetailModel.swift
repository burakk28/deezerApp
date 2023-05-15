//
//  CategoryDetailModel.swift
//  deezerApp
//
//  Created by Burak Kara on 9.05.2023.
//

import Foundation

 // MARK: -CategoryDetailModel

struct CategoryDetailModel:Decodable {
  let data : [CategoryDetail]
}
struct CategoryDetail:Decodable {
  var id:Int?
  var name : String?
  var picture_medium :String?
}
