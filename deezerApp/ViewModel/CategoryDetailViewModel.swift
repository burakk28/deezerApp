//
//  CategoryDetailViewModel.swift
//  deezerApp
//
//  Created by Burak Kara on 10.05.2023.
//

import Foundation

struct CategoryDetailViewModel {
  
  let categoryDetail:CategoryDetail
  
  init(categoryDetail: CategoryDetail){
    self.categoryDetail = categoryDetail
  }
  
  var id:Int?{
    return (categoryDetail.id ?? 0)
  }
  var musicName:String?{
    return "\(categoryDetail.name ?? "")"
  }
  var picture_medium :URL?{
    return URL(string:categoryDetail.picture_medium ?? "")
  }
  
}
